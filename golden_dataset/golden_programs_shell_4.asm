; DESCRIPTION: Draws a red rectangle at the screen with fixed size.

; shell.asm -- Phase 29: Interactive command shell for Geometry OS
;
; A minimal command shell that provides:
; - Command prompt display
; - Built-in commands: help, echo, ls, cat, ps, kill, export, clear, rm, cp
; - External program execution via EXEC
; - Pipe operator (cmd1 | cmd2)
; - Output redirection (cmd > file, cmd >> file)
; - Input redirection (cmd < file)
;
; Memory layout:
;   0x0200 - 0x03FF: command input buffer (256 bytes)
;   0x0400 - 0x05FF: parsed command name (256 bytes)
;   0x0600 - 0x07FF: parsed argument (256 bytes)
;   0x0800 - 0x0FFF: file listing buffer (LS output)
;   0x1000 - 0x10FF: read buffer for cat
;   0x1100 - 0x11FF: working directory / env var buffer
;   0x1200:         readln position counter
;   0x1201:         prompt y position
;   0x1202:         child PID storage
;   0x1203:         pipe read fd
;   0x1204:         pipe write fd
;   0x1205:         redirect mode (0=none, 1=>, 2=>>, 3=<)
;   0x1206:         redirect fd
;   0x1207:         pipe mode flag (0=no pipe, 1=pipe)
;   0x1300 - 0x13FF: help text buffer
;   0x1400 - 0x14FF: pipe command buffer (second command in pipeline)
;   0x1500 - 0x15FF: status message buffer

.org 0x000

; ═══════════════════════════════════════════════════════════════
; Initialize shell
; ═══════════════════════════════════════════════════════════════
    LDI r10, 0
    FILL r10               ; clear screen to black
    LDI r0, 0x1201
    LDI r10, 20
    STORE r0, r10          ; prompt y starts at line 20
    LDI r0, 0x1207
    LDI r10, 0
    STORE r0, r10          ; pipe mode = 0
    LDI r0, 0x1205
    STORE r0, r10          ; redirect mode = 0

    ; Write help text to buffer at 0x1300
    LDI r0, 0x1300
    LDI r10, 104       ; h
    STORE r0, r10
    LDI r0, 0x1301
    LDI r10, 101       ; e
    STORE r0, r10
    LDI r0, 0x1302
    LDI r10, 108       ; l
    STORE r0, r10
    LDI r0, 0x1303
    LDI r10, 112       ; p
    STORE r0, r10
    LDI r0, 0x1304
    LDI r10, 0
    STORE r0, r10

; ═══════════════════════════════════════════════════════════════
; Main loop: display prompt, read command, execute
; ═══════════════════════════════════════════════════════════════
main_loop:
    ; Display prompt "> " at current y position
    LDI r0, 0x1201         ; r0 = prompt y addr
    LOAD r1, r0            ; r1 = y position
    LDI r11, 2              ; x = 2
    LDI r5, prompt_str
    TEXT r11, r1, r5

    ; Read a line of input
    LDI r10, 0x0200         ; buf addr
    LDI r1, 200            ; max len
    LDI r11, 0x1200         ; pos addr
    LDI r0, 0x1200
    LDI r5, 0
    STORE r0, r5           ; reset position

readln_loop:
    READLN r10, r1, r11
    CMP r10, r5             ; r10 == 0 means still reading
    JZ r10, readln_loop

    ; r10 > 0 means line complete (Enter pressed)
    ; Check if line is empty
    JZ r10, main_loop       ; empty line, loop

    ; Parse and execute the command
    CALL parse_command
    CALL execute_command

    ; Scroll down prompt position
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1

    ; If y > 240, scroll screen and reset
    LDI r10, 240
    CMP r1, r10
    BLT r1, main_loop
    LDI r10, 10
    SCROLL r10
    LDI r1, 20
    STORE r0, r1
    JMP main_loop

; ═══════════════════════════════════════════════════════════════
; parse_command -- extract command name and argument from input
; Input: command buffer at 0x0200
; Output: command at 0x0400, argument at 0x0600
; Also sets pipe mode (0x1207) and redirect mode (0x1205)
; ═══════════════════════════════════════════════════════════════
parse_command:
    PUSH r12
    PUSH r2
    PUSH r3
    PUSH r4

    ; Reset pipe mode and redirect mode
    LDI r0, 0x1207
    LDI r10, 0
    STORE r0, r10
    LDI r0, 0x1205
    STORE r0, r10

    ; Skip leading spaces
    LDI r12, 0x0200       ; src pointer
skip_spaces:
    LOAD r10, r12
    JZ r10, parse_done      ; empty string
    LDI r1, 32
    CMP r10, r1
    JZ r10, skip_spaces     ; skip space

    ; Copy command name until space or null
    LDI r2, 0x0400       ; dest for command name
copy_cmd:
    LOAD r10, r12
    JZ r10, parse_cmd_done
    LDI r1, 32
    CMP r10, r1
    JZ r10, parse_cmd_done
    ; Check for pipe character '|' (124)
    LDI r1, 124
    CMP r10, r1
    JZ r10, parse_pipe_found
    ; Check for '>' (62)
    LDI r1, 62
    CMP r10, r1
    JZ r10, parse_redirect_out
    ; Check for '<' (60)
    LDI r1, 60
    CMP r10, r1
    JZ r10, parse_redirect_in
    STORE r2, r10
    ADD r12, r5            ; r5 is still 0 from earlier... let's use r1
    ; Actually need to increment properly
    LDI r1, 1
    ADD r12, r1
    LDI r1, 1
    ADD r2, r1
    JMP copy_cmd

parse_cmd_done:
    ; Null terminate command
    LDI r10, 0
    STORE r2, r10

    ; Skip spaces after command
    LOAD r10, r12
    JZ r10, parse_arg_done  ; no argument
skip_arg_spaces:
    LOAD r10, r12
    LDI r1, 32
    CMP r10, r1
    JZ r10, skip_arg_spaces_inc
    JMP copy_arg_start
skip_arg_spaces_inc:
    LDI r1, 1
    ADD r12, r1
    JMP skip_arg_spaces

copy_arg_start:
    ; Copy argument until null
    LDI r2, 0x0600       ; dest for argument
copy_arg:
    LOAD r10, r12
    JZ r10, parse_arg_done
    ; Check for pipe
    LDI r1, 124
    CMP r10, r1
    JZ r10, parse_pipe_found_arg
    ; Check for redirect
    LDI r1, 62
    CMP r10, r1
    JZ r10, parse_redirect_out_arg
    LDI r1, 60
    CMP r10, r1
    JZ r10, parse_redirect_in_arg
    STORE r2, r10
    LDI r1, 1
    ADD r12, r1
    ADD r2, r1
    JMP copy_arg

parse_arg_done:
    LDI r10, 0
    STORE r2, r10
    JMP parse_done

parse_pipe_found:
    ; Null terminate command
    LDI r10, 0
    STORE r2, r10
    ; Set pipe mode
    LDI r0, 0x1207
    LDI r10, 1
    STORE r0, r10
    ; Skip pipe char and spaces
    LDI r1, 1
    ADD r12, r1
skip_pipe_spaces:
    LOAD r10, r12
    LDI r1, 32
    CMP r10, r1
    JZ r10, skip_pipe_spaces_inc
    JMP copy_pipe_cmd
skip_pipe_spaces_inc:
    LDI r1, 1
    ADD r12, r1
    JMP skip_pipe_spaces

copy_pipe_cmd:
    ; Copy second command to pipe buffer at 0x1400
    LDI r2, 0x1400
copy_pipe_loop:
    LOAD r10, r12
    JZ r10, parse_pipe_done
    STORE r2, r10
    LDI r1, 1
    ADD r12, r1
    ADD r2, r1
    JMP copy_pipe_loop
parse_pipe_done:
    LDI r10, 0
    STORE r2, r10
    JMP parse_done

parse_pipe_found_arg:
    ; Null terminate argument
    LDI r10, 0
    STORE r2, r10
    ; Set pipe mode
    LDI r0, 0x1207
    LDI r10, 1
    STORE r0, r10
    ; Skip pipe char and spaces
    LDI r1, 1
    ADD r12, r1
skip_pipe_spaces2:
    LOAD r10, r12
    LDI r1, 32
    CMP r10, r1
    JZ r10, skip_pipe_spaces2_inc
    JMP copy_pipe_cmd2
skip_pipe_spaces2_inc:
    LDI r1, 1
    ADD r12, r1
    JMP skip_pipe_spaces2

copy_pipe_cmd2:
    LDI r2, 0x1400
copy_pipe_loop2:
    LOAD r10, r12
    JZ r10, parse_done2
    STORE r2, r10
    LDI r1, 1
    ADD r12, r1
    ADD r2, r1
    JMP copy_pipe_loop2
parse_done2:
    LDI r10, 0
    STORE r2, r10
    JMP parse_done

parse_redirect_out:
    ; Null terminate command
    LDI r10, 0
    STORE r2, r10
    ; Check for >> (append)
    LDI r1, 1
    ADD r12, r1
    LOAD r10, r12
    LDI r1, 62
    CMP r10, r1
    JZ r10, redirect_append
    ; Single > = write (mode 1)
    LDI r0, 0x1205
    LDI r10, 1
    STORE r0, r10
    JMP skip_redir_spaces
redirect_append:
    LDI r0, 0x1205
    LDI r10, 2
    STORE r0, r10
    LDI r1, 1
    ADD r12, r1
    JMP skip_redir_spaces

parse_redirect_out_arg:
    ; Null terminate argument
    LDI r10, 0
    STORE r2, r10
    LDI r1, 1
    ADD r12, r1
    LOAD r10, r12
    LDI r1, 62
    CMP r10, r1
    JZ r10, redirect_append2
    LDI r0, 0x1205
    LDI r10, 1
    STORE r0, r10
    JMP skip_redir_spaces
redirect_append2:
    LDI r0, 0x1205
    LDI r10, 2
    STORE r0, r10
    LDI r1, 1
    ADD r12, r1
    JMP skip_redir_spaces

parse_redirect_in:
    LDI r10, 0
    STORE r2, r10
    LDI r0, 0x1205
    LDI r10, 3
    STORE r0, r10
    LDI r1, 1
    ADD r12, r1
    JMP skip_redir_spaces

parse_redirect_in_arg:
    LDI r10, 0
    STORE r2, r10
    LDI r0, 0x1205
    LDI r10, 3
    STORE r0, r10
    LDI r1, 1
    ADD r12, r1
    JMP skip_redir_spaces

skip_redir_spaces:
    LOAD r10, r12
    LDI r1, 32
    CMP r10, r1
    JZ r10, skip_redir_spaces_inc
    JMP copy_redir_file
skip_redir_spaces_inc:
    LDI r1, 1
    ADD r12, r1
    JMP skip_redir_spaces

copy_redir_file:
    ; Copy redirect filename to argument buffer (0x0600)
    LDI r2, 0x0600
copy_redir_loop:
    LOAD r10, r12
    JZ r10, parse_done
    STORE r2, r10
    LDI r1, 1
    ADD r12, r1
    ADD r2, r1
    JMP copy_redir_loop

parse_done:
    POP r4
    POP r3
    POP r2
    POP r12
    RET

; ═══════════════════════════════════════════════════════════════
; execute_command -- dispatch to built-in or EXEC
; Command at 0x0400, argument at 0x0600
; ═══════════════════════════════════════════════════════════════
execute_command:
    PUSH r12
    PUSH r2
    PUSH r3

    ; Check for empty command
    LDI r0, 0x0400
    LOAD r10, r0
    JZ r10, exec_done

    ; Compare command with known built-ins
    ; help
    CALL cmd_is_help
    JNZ r10, do_help

    ; echo
    CALL cmd_is_echo
    JNZ r10, do_echo

    ; ls
    CALL cmd_is_ls
    JNZ r10, do_ls

    ; cat
    CALL cmd_is_cat
    JNZ r10, do_cat

    ; ps
    CALL cmd_is_ps
    JNZ r10, do_ps

    ; kill
    CALL cmd_is_kill
    JNZ r10, do_kill

    ; export
    CALL cmd_is_export
    JNZ r10, do_export

    ; clear
    CALL cmd_is_clear
    JNZ r10, do_clear

    ; rm
    CALL cmd_is_rm
    JNZ r10, do_rm

    ; cp
    CALL cmd_is_cp
    JNZ r10, do_cp

    ; hypervisor
    CALL cmd_is_hypervisor
    JNZ r10, do_hypervisor

    ; edit
    CALL cmd_is_edit
    JNZ r10, do_edit

    ; save
    CALL cmd_is_save
    JNZ r10, do_save

    ; grep
    CALL cmd_is_grep
    JNZ r10, do_grep

    ; head
    CALL cmd_is_head
    JNZ r10, do_head

    ; tail
    CALL cmd_is_tail
    JNZ r10, do_tail

    ; wc
    CALL cmd_is_wc
    JNZ r10, do_wc

    ; date
    CALL cmd_is_date
    JNZ r10, do_date

    ; Not a built-in -- try EXEC
    JMP do_exec

exec_done:
    POP r3
    POP r2
    POP r12
    RET

; ── Command comparison helpers ────────────────────────────────
; Each sets r10=1 if match, r10=0 if not

cmd_is_help:
    LDI r0, 0x0400
    LDI r10, 104       ; h
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cmd_help_n
    LDI r0, 0x0401
    LDI r10, 101       ; e
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cmd_help_n
    LDI r0, 0x0402
    LDI r10, 108       ; l
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cmd_help_n
    LDI r0, 0x0403
    LDI r10, 112       ; p
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cmd_help_n
    LDI r0, 0x0404
    LDI r10, 0
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cmd_help_n
    LDI r10, 1
    RET
cmd_help_n:
    LDI r10, 0
    RET

cmd_is_echo:
    LDI r0, 0x0400
    LDI r10, 101       ; e
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0401
    LDI r10, 99        ; c
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0402
    LDI r10, 104       ; h
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0403
    LDI r10, 111       ; o
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0404
    LDI r10, 0
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r10, 1
    RET

cmd_is_ls:
    LDI r0, 0x0400
    LDI r10, 108       ; l
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0401
    LDI r10, 115       ; s
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0402
    LDI r10, 0
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r10, 1
    RET

cmd_is_cat:
    LDI r0, 0x0400
    LDI r10, 99        ; c
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0401
    LDI r10, 97        ; a
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0402
    LDI r10, 116       ; t
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0403
    LDI r10, 0
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r10, 1
    RET

cmd_is_ps:
    LDI r0, 0x0400
    LDI r10, 112       ; p
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0401
    LDI r10, 115       ; s
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0402
    LDI r10, 0
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r10, 1
    RET

cmd_is_kill:
    LDI r0, 0x0400
    LDI r10, 107       ; k
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0401
    LDI r10, 105       ; i
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0402
    LDI r10, 108       ; l
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0403
    LDI r10, 108       ; l
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0404
    LDI r10, 0
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r10, 1
    RET

cmd_is_export:
    LDI r0, 0x0400
    LDI r10, 101       ; e
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0401
    LDI r10, 120       ; x
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0402
    LDI r10, 112       ; p
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0403
    LDI r10, 111       ; o
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0404
    LDI r10, 114       ; r
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0405
    LDI r10, 116       ; t
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0406
    LDI r10, 0
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r10, 1
    RET

cmd_is_clear:
    LDI r0, 0x0400
    LDI r10, 99        ; c
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0401
    LDI r10, 108       ; l
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0402
    LDI r10, 101       ; e
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0403
    LDI r10, 97        ; a
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0404
    LDI r10, 114       ; r
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0405
    LDI r10, 0
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r10, 1
    RET

cmd_is_rm:
    LDI r0, 0x0400
    LDI r10, 114       ; r
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0401
    LDI r10, 109       ; m
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0402
    LDI r10, 0
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r10, 1
    RET

cmd_is_cp:
    LDI r0, 0x0400
    LDI r10, 99        ; c
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0401
    LDI r10, 112       ; p
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0402
    LDI r10, 0
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r10, 1
    RET

cmd_is_hypervisor:
    LDI r0, 0x0400
    LDI r10, 104       ; h
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0401
    LDI r10, 121       ; y
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0402
    LDI r10, 112       ; p
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0403
    LDI r10, 101       ; e
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0404
    LDI r10, 114       ; r
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0405
    LDI r10, 118       ; v
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0406
    LDI r10, 105       ; i
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0407
    LDI r10, 115       ; s
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0408
    LDI r10, 111       ; o
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0409
    LDI r10, 114       ; r
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x040A
    LDI r10, 0
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r10, 1
    RET

cmd_is_edit:
    LDI r0, 0x0400
    LDI r10, 101       ; e
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0401
    LDI r10, 100       ; d
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0402
    LDI r10, 105       ; i
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0403
    LDI r10, 116       ; t
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0404
    LDI r10, 0
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r10, 1
    RET

cmd_is_save:
    LDI r0, 0x0400
    LDI r10, 115       ; s
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0401
    LDI r10, 97        ; a
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0402
    LDI r10, 118       ; v
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0403
    LDI r10, 101       ; e
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0404
    LDI r10, 0
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r10, 1
    RET

cmd_is_grep:
    LDI r0, 0x0400
    LDI r10, 103       ; g
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0401
    LDI r10, 114       ; r
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0402
    LDI r10, 101       ; e
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0403
    LDI r10, 112       ; p
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0404
    LDI r10, 0
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r10, 1
    RET

cmd_is_head:
    LDI r0, 0x0400
    LDI r10, 104       ; h
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0401
    LDI r10, 101       ; e
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0402
    LDI r10, 97        ; a
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0403
    LDI r10, 100       ; d
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0404
    LDI r10, 0
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r10, 1
    RET

cmd_is_tail:
    LDI r0, 0x0400
    LDI r10, 116       ; t
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0401
    LDI r10, 97        ; a
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0402
    LDI r10, 105       ; i
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0403
    LDI r10, 108       ; l
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0404
    LDI r10, 0
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r10, 1
    RET

cmd_is_wc:
    LDI r0, 0x0400
    LDI r10, 119       ; w
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0401
    LDI r10, 99        ; c
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0402
    LDI r10, 0
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r10, 1
    RET

cmd_is_date:
    LDI r0, 0x0400
    LDI r10, 100       ; d
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0401
    LDI r10, 97        ; a
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0402
    LDI r10, 116       ; t
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0403
    LDI r10, 101       ; e
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r0, 0x0404
    LDI r10, 0
    LOAD r1, r0
    CMP r10, r1
    JNZ r10, cno
    LDI r10, 1
    RET

cno:
    LDI r10, 0
    RET

; ── Built-in command implementations ──────────────────────────

do_help:
    ; Display available commands
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r11, 2
    LDI r5, help_text
    TEXT r11, r1, r5
    JMP exec_done

do_echo:
    ; Print the argument
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, 0x0600
    TEXT r11, r1, r5
    JMP exec_done

do_ls:
    ; List files using LS opcode
    LDI r1, 0x0800
    LS r1                  ; list files into buffer at 0x0800
    ; r10 = number of files
    ; Display each filename
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, 0x0800
    TEXT r11, r1, r5
    JMP exec_done

do_cat:
    ; Read and display a file
    ; Argument (filename) at 0x0600
    LDI r1, 0x0600       ; filename addr
    LDI r11, 0            ; mode = read
    OPEN r1, r11           ; r10 = fd
    ; Check for error
    LDI r1, 0xFFFFFFFF
    CMP r10, r1
    JZ r10, exec_done      ; error, skip

    MOV r13, r10            ; save fd in r13
    LDI r5, 0x1000        ; read buffer
    LDI r9, 200           ; max bytes
    READ r13, r5, r9       ; r10 = bytes read
    ; Null terminate
    LDI r6, 200
    CMP r10, r6
    BLT r10, cat_term_ok
    LDI r10, 200
cat_term_ok:
    LDI r6, 0x1000
    ADD r10, r6
    LDI r7, 0
    STORE r10, r7
    ; Display
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, 0x1000
    TEXT r11, r1, r5
    CLOSE r13
    JMP exec_done

do_ps:
    ; Display process info
    ; For now, show PID count and current PID
    GETPID
    MOV r13, r10            ; save our PID
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    ; Show "PID: N" using register value
    ; Write PID as text at 0x1500
    LDI r0, 0x1500
    LDI r10, 80            ; P
    STORE r0, r10
    LDI r0, 0x1501
    LDI r10, 73            ; I
    STORE r0, r10
    LDI r0, 0x1502
    LDI r10, 68            ; D
    STORE r0, r10
    LDI r0, 0x1503
    LDI r10, 58            ; :
    STORE r0, r10
    LDI r0, 0x1504
    LDI r10, 32            ; space
    STORE r0, r10
    ; Convert PID to decimal digits
    LDI r0, 0x1505
    LDI r1, 48            ; '0'
    ADD r10, r1
    STORE r0, r10
    LDI r0, 0x1506
    LDI r10, 0
    STORE r0, r10
    LDI r11, 4
    LDI r5, 0x1500
    TEXT r11, r1, r5
    JMP exec_done

do_kill:
    ; Kill a process by PID
    ; Argument should be a number -- simplified: just echo "kill"
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r5, kill_msg
    LDI r11, 4
    TEXT r11, r1, r5
    JMP exec_done

do_export:
    ; Set environment variable
    ; Argument format: KEY=VALUE
    ; For simplicity, just acknowledge
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r5, export_msg
    LDI r11, 4
    TEXT r11, r1, r5
    JMP exec_done

do_clear:
    LDI r10, 0
    FILL r10
    LDI r0, 0x1201
    LDI r10, 20
    STORE r0, r10
    JMP exec_done

do_rm:
    ; Delete a file: rm <filename>
    ; Argument (filename) at 0x0600
    LDI r0, 0x0600
    LOAD r10, r0
    JZ r10, rm_usage
    ; Copy arg to a clean buffer at 0x1600
    LDI r3, 0x0600
    LDI r2, 0x1600
rm_copy:
    LOAD r10, r3
    JZ r10, rm_copy_done
    STORE r2, r10
    LDI r10, 1
    ADD r3, r10
    ADD r2, r10
    JMP rm_copy
rm_copy_done:
    LDI r10, 0
    STORE r2, r10      ; null terminate
    ; UNLINK r1 where r1 = 0x1600
    LDI r1, 0x1600
    UNLINK r1
    ; r10 = 0 on success, 0xFFFFFFFF on error
    LDI r1, 0xFFFFFFFF
    CMP r10, r1
    JNZ r10, rm_ok
    ; Print error
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r11, 8          ; "rm: error"
    LDI r5, 0x1700
    ; Store "rm: error" message
    LDI r0, 0x1700
    LDI r10, 114        ; r
    STORE r0, r10
    LDI r0, 0x1701
    LDI r10, 109        ; m
    STORE r0, r10
    LDI r0, 0x1702
    LDI r10, 58         ; :
    STORE r0, r10
    LDI r0, 0x1703
    LDI r10, 32         ; space
    STORE r0, r10
    LDI r0, 0x1704
    LDI r10, 101        ; e
    STORE r0, r10
    LDI r0, 0x1705
    LDI r10, 114        ; r
    STORE r0, r10
    LDI r0, 0x1706
    LDI r10, 114        ; r
    STORE r0, r10
    LDI r0, 0x1707
    LDI r10, 111        ; o
    STORE r0, r10
    LDI r0, 0x1708
    LDI r10, 114        ; r
    STORE r0, r10
    LDI r0, 0x1709
    LDI r10, 0
    STORE r0, r10
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r11, 9
    LDI r5, 0x1700
    TEXT r11, r1, r5
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    JMP exec_done
rm_ok:
    JMP exec_done
rm_usage:
    ; Print "rm <file>"
    LDI r0, 0x1700
    LDI r10, 114        ; r
    STORE r0, r10
    LDI r0, 0x1701
    LDI r10, 109        ; m
    STORE r0, r10
    LDI r0, 0x1702
    LDI r10, 32         ; space
    STORE r0, r10
    LDI r0, 0x1703
    LDI r10, 60         ; <
    STORE r0, r10
    LDI r0, 0x1704
    LDI r10, 102        ; f
    STORE r0, r10
    LDI r0, 0x1705
    LDI r10, 105        ; i
    STORE r0, r10
    LDI r0, 0x1706
    LDI r10, 108        ; l
    STORE r0, r10
    LDI r0, 0x1707
    LDI r10, 101        ; e
    STORE r0, r10
    LDI r0, 0x1708
    LDI r10, 62         ; >
    STORE r0, r10
    LDI r0, 0x1709
    LDI r10, 0
    STORE r0, r10
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r11, 9
    LDI r5, 0x1700
    TEXT r11, r1, r5
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    JMP exec_done

do_cp:
    ; Copy a file: cp <src> <dst>
    ; Arguments at 0x0600, separated by space
    ; Parse second argument from 0x0600 into 0x1800
    LDI r0, 0x0600
    LOAD r10, r0
    JZ r10, cp_usage
    ; Find space separator
    LDI r3, 0x0600
cp_find_space:
    LOAD r10, r3
    JZ r10, cp_usage    ; no space found -- need 2 args
    LDI r1, 32         ; space
    CMP r10, r1
    JZ r10, cp_found_space
    LDI r10, 1
    ADD r3, r10
    JMP cp_find_space
cp_found_space:
    ; Skip the space, copy rest to 0x1800
    LDI r10, 1
    ADD r3, r10
    LDI r2, 0x1800
cp_copy_dst:
    LOAD r10, r3
    JZ r10, cp_copy_dst_done
    STORE r2, r10
    LDI r10, 1
    ADD r3, r10
    ADD r2, r10
    JMP cp_copy_dst
cp_copy_dst_done:
    LDI r10, 0
    STORE r2, r10
    ; Null-terminate the source filename (replace space with 0)
    LDI r3, 0x0600
    LDI r2, 0x1600
cp_copy_src:
    LOAD r10, r3
    JZ r10, cp_src_done
    LDI r1, 32
    CMP r10, r1
    JZ r10, cp_src_terminate
    STORE r2, r10
    LDI r10, 1
    ADD r3, r10
    ADD r2, r10
    JMP cp_copy_src
cp_src_terminate:
    LDI r10, 0
    STORE r2, r10
    JMP cp_do_copy
cp_src_done:
    STORE r2, r10
cp_do_copy:
    ; FCOPY r1, r11 where r1=0x1600 (src), r11=0x1800 (dst)
    LDI r1, 0x1600
    LDI r11, 0x1800
    FCOPY r1, r11
    ; Check result
    LDI r1, 0xFFFFFFFF
    CMP r10, r1
    JNZ r10, cp_ok
    ; Print error
    LDI r0, 0x1700
    LDI r10, 99         ; c
    STORE r0, r10
    LDI r0, 0x1701
    LDI r10, 112        ; p
    STORE r0, r10
    LDI r0, 0x1702
    LDI r10, 58         ; :
    STORE r0, r10
    LDI r0, 0x1703
    LDI r10, 32         ; space
    STORE r0, r10
    LDI r0, 0x1704
    LDI r10, 101        ; e
    STORE r0, r10
    LDI r0, 0x1705
    LDI r10, 114        ; r
    STORE r0, r10
    LDI r0, 0x1706
    LDI r10, 114        ; r
    STORE r0, r10
    LDI r0, 0x1707
    LDI r10, 111        ; o
    STORE r0, r10
    LDI r0, 0x1708
    LDI r10, 114        ; r
    STORE r0, r10
    LDI r0, 0x1709
    LDI r10, 0
    STORE r0, r10
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r11, 9
    LDI r5, 0x1700
    TEXT r11, r1, r5
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    JMP exec_done
cp_ok:
    JMP exec_done
cp_usage:
    LDI r0, 0x1700
    LDI r10, 99         ; c
    STORE r0, r10
    LDI r0, 0x1701
    LDI r10, 112        ; p
    STORE r0, r10
    LDI r0, 0x1702
    LDI r10, 32         ; space
    STORE r0, r10
    LDI r0, 0x1703
    LDI r10, 60         ; <
    STORE r0, r10
    LDI r0, 0x1704
    LDI r10, 115        ; s
    STORE r0, r10
    LDI r0, 0x1705
    LDI r10, 114        ; r
    STORE r0, r10
    LDI r0, 0x1706
    LDI r10, 99        ; c
    STORE r0, r10
    LDI r0, 0x1707
    LDI r10, 62         ; >
    STORE r0, r10
    LDI r0, 0x1708
    LDI r10, 32         ; space
    STORE r0, r10
    LDI r0, 0x1709
    LDI r10, 60         ; <
    STORE r0, r10
    LDI r0, 0x170A
    LDI r10, 100        ; d
    STORE r0, r10
    LDI r0, 0x170B
    LDI r10, 115        ; s
    STORE r0, r10
    LDI r0, 0x170C
    LDI r10, 116        ; t
    STORE r0, r10
    LDI r0, 0x170D
    LDI r10, 62         ; >
    STORE r0, r10
    LDI r0, 0x170E
    LDI r10, 0
    STORE r0, r10
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r11, 14
    LDI r5, 0x1700
    TEXT r11, r1, r5
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    JMP exec_done

do_hypervisor:
    PUSH r2
    PUSH r3
    ; Check if argument exists
    LDI r0, 0x0600
    LOAD r10, r0
    JZ r10, hypervisor_usage

    ; Copy argument (0x0600) to config buffer (0x1B00)
    LDI r3, 0x0600       ; src
    LDI r2, 0x1B00       ; dst
hypervisor_copy:
    LOAD r10, r3
    JZ r10, hypervisor_copy_done
    STORE r2, r10
    LDI r10, 1
    ADD r3, r10
    ADD r2, r10
    JMP hypervisor_copy
hypervisor_copy_done:
    LDI r10, 0
    STORE r2, r10         ; null terminate

    ; Call HYPERVISOR with config buffer address
    LDI r10, 0x1B00
    HYPERVISOR r10

    ; Check result: 0 = success, 0xFFFFFFFF = error, 0xFFFFFFFD = missing arch
    JZ r10, hypervisor_ok
    LDI r1, 0xFFFFFFFF
    CMP r10, r1
    JZ r10, hypervisor_err
    ; Missing arch or other error
    JMP hypervisor_err

hypervisor_ok:
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    ; Display "hypervisor started" message
    LDI r11, 4
    LDI r5, hypervisor_ok_msg
    TEXT r11, r1, r5
    JMP hypervisor_done

hypervisor_usage:
    ; No argument -- show usage
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, hypervisor_usage_msg
    TEXT r11, r1, r5
    JMP hypervisor_done

hypervisor_err:
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, hypervisor_err_msg
    TEXT r11, r1, r5
    JMP hypervisor_done

hypervisor_done:
    POP r3
    POP r2
    JMP exec_done

do_edit:
    PUSH r12
    PUSH r2
    PUSH r3
    PUSH r4

    ; Check for argument
    LDI r0, 0x0600
    LOAD r10, r0
    JZ r10, edit_usage

    ; Open file for reading
    LDI r1, 0x0600       ; filename addr
    LDI r11, 0            ; mode = read
    OPEN r1, r11           ; r10 = fd
    ; Check for error
    LDI r1, 0xFFFFFFFF
    CMP r10, r1
    JZ r10, edit_err      ; file not found

    MOV r13, r10            ; save fd in r13

    ; Read file content into buffer at 0x2000
    LDI r5, 0x2000        ; read buffer (8KB, up to row 127 * 32 cols)
    LDI r9, 4096          ; max words to read
    READ r13, r5, r9       ; r10 = bytes read

    ; Close the file
    CLOSE r13

    ; Null terminate at position bytes_read
    LDI r6, 0x2000
    ADD r6, r10            ; r6 = buffer + bytes_read
    LDI r7, 0
    STORE r6, r7          ; null terminator

    ; Display file content on screen, line by line
    ; Each line is up to 32 chars, separated by newline (10) or null
    LDI r15, 0x2000       ; source pointer
    LDI r8, 4            ; y position (start near top)
    LDI r4, 0            ; line buffer index

edit_line_loop:
    LOAD r10, r15
    JZ r10, edit_done      ; null = end of file

    ; Check for newline (10)
    LDI r1, 10
    CMP r10, r1
    JZ r10, edit_newline

    ; Store char in line buffer at 0x2100 + index
    LDI r3, 0x2100
    ADD r3, r4
    STORE r3, r10

    LDI r1, 1
    ADD r15, r1           ; advance source
    ADD r4, r1           ; advance line index

    ; Check if line is 32 chars (screen width at 8px font)
    LDI r1, 32
    CMP r4, r1
    JZ r10, edit_line_full
    JMP edit_line_loop

edit_newline:
    ; Null-terminate current line
    LDI r3, 0x2100
    ADD r3, r4
    LDI r10, 0
    STORE r3, r10

    ; Display line at y position
    LDI r11, 4             ; x = 4
    LDI r5, 0x2100        ; line buffer
    TEXT r11, r8, r5      ; render text at (4, y)

    ; Advance to next line
    LDI r1, 1
    ADD r15, r1           ; skip the newline char
    ADD r8, r1           ; next y position
    LDI r4, 0            ; reset line buffer index
    JMP edit_line_loop

edit_line_full:
    ; Null-terminate
    LDI r3, 0x2100
    ADD r3, r4
    LDI r10, 0
    STORE r3, r10

    ; Display line
    LDI r11, 4
    LDI r5, 0x2100
    TEXT r11, r8, r5

    ; Next line (no source advance since char was already stored)
    LDI r1, 1
    ADD r15, r1
    ADD r8, r1
    LDI r4, 0
    JMP edit_line_loop

edit_done:
    ; Null-terminate last line if there's content
    JZ r4, edit_show_msg
    LDI r3, 0x2100
    ADD r3, r4
    LDI r10, 0
    STORE r3, r10
    LDI r11, 4
    LDI r5, 0x2100
    TEXT r11, r8, r5

edit_show_msg:
    ; Show "[edit: filename]" at bottom
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, edit_ok_msg
    TEXT r11, r1, r5
    JMP edit_cleanup

edit_usage:
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, edit_usage_msg
    TEXT r11, r1, r5
    JMP edit_cleanup

edit_err:
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, edit_err_msg
    TEXT r11, r1, r5

edit_cleanup:
    POP r4
    POP r3
    POP r2
    POP r12
    JMP exec_done

do_save:
    PUSH r12
    PUSH r2
    PUSH r3
    PUSH r4

    ; Check for argument
    LDI r0, 0x0600
    LOAD r10, r0
    JZ r10, save_usage

    ; Open file for writing (mode 1 = write/create)
    LDI r1, 0x0600       ; filename addr
    LDI r11, 1            ; mode = write
    OPEN r1, r11           ; r10 = fd
    ; Check for error
    LDI r1, 0xFFFFFFFF
    CMP r10, r1
    JZ r10, save_err      ; could not create file

    MOV r13, r10            ; save fd in r13

    ; Calculate content length from edit buffer at 0x2000
    ; Scan for null terminator
    LDI r15, 0x2000
    LDI r8, 0            ; length counter
save_scan:
    LOAD r10, r15
    JZ r10, save_scan_done
    LDI r1, 1
    ADD r15, r1
    ADD r8, r1
    JMP save_scan

save_scan_done:
    ; If nothing to save, show message
    JZ r8, save_empty

    ; Write content to file
    LDI r1, 0x2000        ; buffer addr
    MOV r11, r1             ; fd_reg = r13 already
    ; WRITE fd_reg, buf_reg, len_reg
    MOV r1, r13             ; r1 = fd
    LDI r11, 0x2000         ; buf addr
    MOV r5, r8            ; length
    WRITE r1, r11, r5       ; r10 = bytes written

    CLOSE r13               ; close file

    ; Show "[saved: N bytes]" message
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, save_ok_msg
    TEXT r11, r1, r5
    JMP save_cleanup

save_empty:
    CLOSE r13
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, save_empty_msg
    TEXT r11, r1, r5
    JMP save_cleanup

save_usage:
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, save_usage_msg
    TEXT r11, r1, r5
    JMP save_cleanup

save_err:
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, save_err_msg
    TEXT r11, r1, r5

save_cleanup:
    POP r4
    POP r3
    POP r2
    POP r12
    JMP exec_done

do_grep:
    ; grep <pattern> <file> -- search file for lines containing pattern
    ; Argument at 0x0600 is "pattern file"
    ; We need to split: first word = pattern, second word = filename
    PUSH r12
    PUSH r2
    PUSH r3
    PUSH r4
    PUSH r8
    PUSH r15

    ; Parse argument: find first space to split pattern from filename
    ; Store pattern at 0x2200, filename at 0x2300
    LDI r15, 0x0600      ; arg pointer
    LDI r8, 0x2200      ; pattern buffer
    LDI r4, 0           ; pattern length

grep_parse_pat:
    LOAD r10, r15
    JZ r10, grep_no_file   ; no space found, error
    LDI r1, 32            ; space
    CMP r10, r1
    JZ r10, grep_copy_file
    STORE r8, r10
    LDI r1, 1
    ADD r15, r1
    ADD r8, r1
    ADD r4, r1
    JMP grep_parse_pat

grep_copy_file:
    ; Skip the space
    LDI r1, 1
    ADD r15, r1
    ; Copy filename to 0x2300
    LDI r8, 0x2300

grep_copy_file_loop:
    LOAD r10, r15
    JZ r10, grep_have_file
    STORE r8, r10
    LDI r1, 1
    ADD r15, r1
    ADD r8, r1
    JMP grep_copy_file_loop

grep_have_file:
    LDI r10, 0
    STORE r8, r10         ; null terminate filename
    ; Null terminate pattern
    LDI r8, 0x2200
    ADD r8, r4
    STORE r8, r10

    ; Check pattern length > 0
    JZ r4, grep_err

    ; Open file
    LDI r1, 0x2300       ; filename addr
    LDI r11, 0            ; mode = read
    OPEN r1, r11           ; r10 = fd
    LDI r1, 0xFFFFFFFF
    CMP r10, r1
    JZ r10, grep_err

    MOV r13, r10            ; save fd

    ; Read file content into 0x2000
    LDI r5, 0x2000
    LDI r9, 400           ; max bytes to read
    READ r13, r5, r9
    CLOSE r13

    ; Null terminate at read position
    LDI r6, 0x2000
    ADD r6, r10
    LDI r7, 0
    STORE r6, r7

    ; Scan file line by line, check if each line contains the pattern
    ; Line buffer at 0x2400, max 64 chars
    ; Save file pointer at 0x2380 (pattern_len * 4 + pattern_buf end)
    ; Actually, save at 0x23FF (safe scratch)
    LDI r15, 0x2000       ; file pointer
    LDI r3, 0            ; match count

grep_line_loop:
    ; Save file pointer to scratch
    MOV r14, r15           ; r14 = saved file ptr

    LOAD r10, r15
    JZ r10, grep_done       ; end of file

    ; Copy line to buffer at 0x2400, track length
    LDI r8, 0x2400
    LDI r4, 0            ; line length

grep_copy_line:
    LOAD r10, r15
    JZ r10, grep_check_line     ; end of file, check this line
    LDI r1, 10                 ; newline
    CMP r10, r1
    JZ r10, grep_advance_nl
    STORE r8, r10
    LDI r1, 1
    ADD r15, r1
    ADD r8, r1
    ADD r4, r1
    LDI r1, 64
    CMP r4, r1
    JZ r10, grep_check_line
    JMP grep_copy_line

grep_advance_nl:
    LDI r1, 1
    ADD r15, r1             ; skip newline

grep_check_line:
    ; Null terminate line buffer
    LDI r10, 0
    STORE r8, r10

    ; Compute pattern length (scan 0x2200 for null)
    LDI r2, 0
    LDI r12, 0x2200

grep_scan_pat_len:
    LOAD r10, r12
    JZ r10, grep_have_pat_len
    LDI r1, 1
    ADD r12, r1
    ADD r2, r1
    JMP grep_scan_pat_len

grep_have_pat_len:
    ; r2 = pattern length, r4 = line length
    ; Skip if line shorter than pattern
    CMP r4, r2
    BLT r10, grep_next_line

    ; Simple substring search: check each starting position
    ; r4 - r2 = max starting position
    SUB r4, r2           ; r4 = max_start (line_len - pat_len)

grep_search_pos:
    ; r8 = current position in line (0x2400 + offset)
    ; Use offset tracking instead of absolute address comparison
    LDI r0, 0              ; search offset

grep_search_pos2:
    CMP r0, r4            ; offset vs max_start
    BGE r10, grep_next_line

    ; Compare pattern with line at offset r0
    LDI r12, 0x2400
    ADD r12, r0            ; r12 = line_base + offset
    LDI r3, 0x2200        ; pattern start
    LDI r1, 0              ; chars matched

grep_cmp_loop:
    LOAD r10, r12
    LOAD r11, r3
    CMP r10, r11
    JNZ r10, grep_no_match_here
    ; Match so far
    LDI r5, 1
    ADD r12, r5
    ADD r3, r5
    ADD r1, r5             ; count matched chars
    CMP r1, r2            ; matched vs pattern_len
    BLT r10, grep_cmp_loop
    JMP grep_found_match

grep_no_match_here:
    LDI r5, 1
    ADD r0, r5             ; advance offset
    JMP grep_search_pos2

grep_found_match:
    ; Display the matching line
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, 0x2400
    TEXT r11, r1, r5

grep_next_line:
    ; Restore file pointer from r14
    MOV r15, r14
    JMP grep_line_loop

grep_no_file:
    ; Missing filename argument
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, grep_usage
    TEXT r11, r1, r5
    JMP grep_cleanup

grep_err:
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, grep_err_msg
    TEXT r11, r1, r5
    JMP grep_cleanup

grep_done:
    POP r15
    POP r8
    POP r4
    POP r3
    POP r2
    POP r12
    JMP exec_done

grep_cleanup:
    POP r15
    POP r8
    POP r4
    POP r3
    POP r2
    POP r12
    JMP exec_done

do_head:
    ; head <file> [N] -- display first N lines (default 10)
    ; Argument at 0x0600 is "file N"
    PUSH r12
    PUSH r2
    PUSH r3
    PUSH r4
    PUSH r8
    PUSH r15

    ; Parse: filename at 0x0600, optional number after space
    ; Copy filename to 0x2200, check for trailing number
    LDI r15, 0x0600
    LDI r8, 0x2200

head_copy_name:
    LOAD r10, r15
    JZ r10, head_name_done
    LDI r1, 32
    CMP r10, r1
    JZ r10, head_parse_n
    STORE r8, r10
    LDI r1, 1
    ADD r15, r1
    ADD r8, r1
    JMP head_copy_name

head_parse_n:
    ; Skip space
    LDI r1, 1
    ADD r15, r1
    ; Parse number (single digit 1-9 for simplicity)
    LDI r2, 10           ; default N = 10
    LOAD r10, r15
    JZ r10, head_name_done  ; no number, use default
    ; Subtract '0' (48) to get digit
    LDI r1, 48
    SUB r10, r1
    ; If result is 1-9, use it; else default 10
    LDI r1, 1
    CMP r10, r1
    BLT r10, head_name_done
    LDI r1, 9
    CMP r10, r1
    BGE r10, head_name_done
    MOV r2, r10           ; use parsed N

head_name_done:
    LDI r10, 0
    STORE r8, r10         ; null terminate filename

    ; Check for empty filename
    LDI r8, 0x2200
    LOAD r10, r8
    JZ r10, head_err

    ; Open file
    LDI r1, 0x2200
    LDI r11, 0
    OPEN r1, r11
    LDI r1, 0xFFFFFFFF
    CMP r10, r1
    JZ r10, head_err

    MOV r13, r10
    LDI r5, 0x2000
    LDI r9, 400
    READ r13, r5, r9
    CLOSE r13

    ; Null terminate
    LDI r6, 0x2000
    ADD r6, r10
    LDI r7, 0
    STORE r6, r7

    ; Display first N lines
    LDI r15, 0x2000       ; file pointer
    LDI r8, 0x2400       ; line buffer
    LDI r3, 0            ; line count
    LDI r4, 0            ; chars in line

head_read_line:
    LOAD r10, r15
    JZ r10, head_done      ; end of file

    LDI r1, 10
    CMP r10, r1
    JZ r10, head_print_line

    STORE r8, r10
    LDI r1, 1
    ADD r15, r1
    ADD r8, r1
    ADD r4, r1
    LDI r1, 32
    CMP r4, r1
    BLT r10, head_read_line
    ; Line too long, print what we have
    JMP head_print_line

head_print_line:
    ; Null terminate
    LDI r10, 0
    STORE r8, r10
    ; Display
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, 0x2400
    TEXT r11, r1, r5

    ; Increment line count, check limit
    LDI r1, 1
    ADD r3, r1
    CMP r3, r2
    BGE r10, head_done

    ; Skip newline if present
    LOAD r10, r15
    LDI r1, 10
    CMP r10, r1
    JZ r10, head_skip_nl
    JMP head_reset_line

head_skip_nl:
    LDI r1, 1
    ADD r15, r1

head_reset_line:
    LDI r8, 0x2400
    LDI r4, 0
    JMP head_read_line

head_done:
    POP r15
    POP r8
    POP r4
    POP r3
    POP r2
    POP r12
    JMP exec_done

head_err:
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, head_usage_msg
    TEXT r11, r1, r5
    POP r15
    POP r8
    POP r4
    POP r3
    POP r2
    POP r12
    JMP exec_done

do_tail:
    ; tail <file> [N] -- display last N lines (default 10)
    ; Strategy: read whole file, count newlines, display last N
    PUSH r12
    PUSH r2
    PUSH r3
    PUSH r4
    PUSH r8
    PUSH r15

    ; Parse: filename at 0x0600, optional number
    LDI r15, 0x0600
    LDI r8, 0x2200

tail_copy_name:
    LOAD r10, r15
    JZ r10, tail_name_done
    LDI r1, 32
    CMP r10, r1
    JZ r10, tail_parse_n
    STORE r8, r10
    LDI r1, 1
    ADD r15, r1
    ADD r8, r1
    JMP tail_copy_name

tail_parse_n:
    LDI r1, 1
    ADD r15, r1
    LDI r2, 10           ; default N = 10
    LOAD r10, r15
    JZ r10, tail_name_done
    LDI r1, 48
    SUB r10, r1
    LDI r1, 1
    CMP r10, r1
    BLT r10, tail_name_done
    LDI r1, 9
    CMP r10, r1
    BGE r10, tail_name_done
    MOV r2, r10

tail_name_done:
    LDI r10, 0
    STORE r8, r10

    LDI r8, 0x2200
    LOAD r10, r8
    JZ r10, tail_err

    ; Open and read file
    LDI r1, 0x2200
    LDI r11, 0
    OPEN r1, r11
    LDI r1, 0xFFFFFFFF
    CMP r10, r1
    JZ r10, tail_err

    MOV r13, r10
    LDI r5, 0x2000
    LDI r9, 400
    READ r13, r5, r9
    CLOSE r13

    LDI r6, 0x2000
    ADD r6, r10
    LDI r7, 0
    STORE r6, r7

    ; Count total lines
    LDI r15, 0x2000
    LDI r3, 1            ; line count (at least 1)

tail_count_lines:
    LOAD r10, r15
    JZ r10, tail_count_done
    LDI r1, 10
    CMP r10, r1
    JNZ r10, tail_count_next
    LDI r1, 1
    ADD r3, r1           ; increment line count
tail_count_next:
    LDI r1, 1
    ADD r15, r1
    JMP tail_count_lines

tail_count_done:
    ; Compute start line: total_lines - N (but min 1)
    MOV r8, r3           ; total_lines
    SUB r8, r2           ; total - N
    LDI r1, 1
    CMP r8, r1
    BGE r10, tail_skip_ok
    MOV r8, r1            ; at least line 1

tail_skip_ok:
    ; Skip to start line
    LDI r15, 0x2000
    LDI r3, 1             ; current line

tail_skip_loop:
    CMP r3, r8
    BGE r10, tail_display   ; reached start line

tail_skip_next:
    LOAD r10, r15
    JZ r10, tail_done       ; end of file
    LDI r1, 10
    CMP r10, r1
    JNZ r10, tail_skip_adv
    LDI r1, 1
    ADD r3, r1            ; next line on newline
tail_skip_adv:
    LDI r1, 1
    ADD r15, r1
    JMP tail_skip_loop

tail_display:
    ; Display remaining lines
    LDI r8, 0x2400       ; line buffer
    LDI r4, 0            ; chars in line

tail_read_char:
    LOAD r10, r15
    JZ r10, tail_flush
    LDI r1, 10
    CMP r10, r1
    JZ r10, tail_flush

    STORE r8, r10
    LDI r1, 1
    ADD r15, r1
    ADD r8, r1
    ADD r4, r1
    LDI r1, 32
    CMP r4, r1
    BLT r10, tail_read_char
    JMP tail_flush

tail_flush:
    LDI r10, 0
    STORE r8, r10
    ; Display line
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, 0x2400
    TEXT r11, r1, r5

    ; Check if we consumed a newline
    LOAD r10, r15
    LDI r1, 10
    CMP r10, r1
    JZ r10, tail_skip_newline

tail_reset:
    LDI r8, 0x2400
    LDI r4, 0
    LOAD r10, r15
    JZ r10, tail_done
    JMP tail_read_char

tail_skip_newline:
    LDI r1, 1
    ADD r15, r1
    JMP tail_reset

tail_done:
    POP r15
    POP r8
    POP r4
    POP r3
    POP r2
    POP r12
    JMP exec_done

tail_err:
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, tail_usage_msg
    TEXT r11, r1, r5
    POP r15
    POP r8
    POP r4
    POP r3
    POP r2
    POP r12
    JMP exec_done

do_wc:
    ; wc <file> -- count lines, words, and bytes
    PUSH r12
    PUSH r2
    PUSH r3
    PUSH r4
    PUSH r8
    PUSH r15

    ; Check for argument
    LDI r0, 0x0600
    LOAD r10, r0
    JZ r10, wc_err

    ; Open file
    LDI r1, 0x0600
    LDI r11, 0
    OPEN r1, r11
    LDI r1, 0xFFFFFFFF
    CMP r10, r1
    JZ r10, wc_err

    MOV r13, r10
    LDI r5, 0x2000
    LDI r9, 400
    READ r13, r5, r9
    MOV r4, r10           ; save byte count
    CLOSE r13

    ; Null terminate
    LDI r6, 0x2000
    ADD r6, r10
    LDI r7, 0
    STORE r6, r7

    ; Count lines and words
    LDI r15, 0x2000       ; file pointer
    LDI r3, 0            ; line count
    LDI r2, 0            ; word count
    LDI r12, 0            ; prev was space (1=yes, 0=no)

wc_scan:
    LOAD r10, r15
    JZ r10, wc_format      ; end of file

    ; Count newlines
    LDI r1, 10
    CMP r10, r1
    JNZ r10, wc_not_nl
    LDI r1, 1
    ADD r3, r1           ; line++
    LDI r12, 1            ; prev = space
    JMP wc_next

wc_not_nl:
    ; Count words: space or other whitespace transitions
    LDI r1, 32            ; space
    CMP r10, r1
    JNZ r10, wc_not_space
    LDI r12, 1            ; prev = space
    JMP wc_next

wc_not_space:
    ; If prev was space and current is not, it is a new word
    LDI r1, 1
    CMP r12, r1
    JNZ r10, wc_next
    ADD r2, r1           ; word++
    LDI r12, 0            ; prev = not space

wc_next:
    LDI r1, 1
    ADD r15, r1
    JMP wc_scan

wc_format:
    ; Build output string at 0x2400: "N N N"
    ; Format: lines words bytes
    LDI r8, 0x2400

    ; Convert lines (r3) to decimal
    CALL wc_utoa
    ; Add space
    LDI r10, 32
    STORE r8, r10
    LDI r1, 1
    ADD r8, r1

    ; Convert words (r2) to decimal
    MOV r15, r2
    CALL wc_utoa
    ; Add space
    LDI r10, 32
    STORE r8, r10
    LDI r1, 1
    ADD r8, r1

    ; Convert bytes (r4) to decimal
    MOV r15, r4
    CALL wc_utoa
    ; Null terminate
    LDI r10, 0
    STORE r8, r10

    ; Display
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, 0x2400
    TEXT r11, r1, r5
    JMP wc_cleanup

wc_utoa:
    ; Convert r15 to decimal, write to buffer at r8
    ; Modifies r15, does not change r8 (caller manages it)
    PUSH r12
    ; Handle 0 case
    JNZ r15, wc_utoa_nonzero
    LDI r10, 48            ; '0'
    STORE r8, r10
    LDI r1, 1
    ADD r8, r1
    POP r12
    RET

wc_utoa_nonzero:
    ; Find number of digits by repeated division
    LDI r12, 0            ; digit count
    LDI r3, 10
    MOV r2, r15          ; temp copy

wc_count_digits:
    JZ r2, wc_do_digits
    LDI r1, 10
    DIV r2, r1
    LDI r1, 1
    ADD r12, r1
    JMP wc_count_digits

wc_do_digits:
    ; r12 = digit count. We need to write digits from most significant.
    ; Write digits to a temp area at 0x2500, then copy in order.
    LDI r3, 0x2500       ; temp digit buffer
    LDI r2, 0            ; digit index
    MOV r15, r2          ; restore original? No, r15 was modified.
    ; Actually we need to re-do the conversion. Let me use a simpler approach:
    ; Write digits in reverse order, then reverse them.
    ; Even simpler: since max bytes ~400, max 3 digits. Handle up to 999.
    POP r12
    PUSH r12
    PUSH r2
    PUSH r3
    PUSH r4

    ; Save r8 (output pointer)
    MOV r4, r8

    ; Write digits in reverse at 0x2500
    LDI r3, 0x2500
    LDI r2, 0            ; digit count

wc_div_loop:
    JZ r15, wc_rev_digits
    LDI r1, 10
    DIV r15, r1
    LDI r1, 48            ; '0'
    ADD r10, r1            ; r10 = digit char
    STORE r3, r10
    LDI r1, 1
    ADD r3, r1
    ADD r2, r1
    JMP wc_div_loop

wc_rev_digits:
    ; r2 = digit count at 0x2500 (reversed)
    ; Copy in reverse order to output
    JZ r2, wc_utoa_done
    LDI r1, 1
    SUB r2, r1
    LDI r3, 0x2500
    ADD r3, r2
    LOAD r10, r3
    STORE r4, r10
    LDI r1, 1
    ADD r4, r1
    JMP wc_rev_digits

wc_utoa_done:
    MOV r8, r4          ; update output pointer
    POP r4
    POP r3
    POP r2
    POP r12
    POP r12
    RET

wc_err:
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, wc_usage_msg
    TEXT r11, r1, r5
wc_cleanup:
    POP r15
    POP r8
    POP r4
    POP r3
    POP r2
    POP r12
    JMP exec_done

do_date:
    ; Display ticks since boot (proxy for uptime)
    PUSH r12
    PUSH r2
    PUSH r3
    PUSH r4

    ; Read TICKS from RAM[0xFFE]
    LDI r0, 0xFFE
    LOAD r15, r0           ; r15 = ticks

    ; Build output: "ticks: NNNN" at 0x2400
    LDI r8, 0x2400
    ; Write "ticks: "
    LDI r10, 116           ; t
    STORE r8, r10
    LDI r1, 1
    ADD r8, r1
    LDI r10, 105           ; i
    STORE r8, r10
    ADD r8, r1
    LDI r10, 99            ; c
    STORE r8, r10
    ADD r8, r1
    LDI r10, 107           ; k
    STORE r8, r10
    ADD r8, r1
    LDI r10, 115           ; s
    STORE r8, r10
    ADD r8, r1
    LDI r10, 58            ; :
    STORE r8, r10
    ADD r8, r1
    LDI r10, 32            ; space
    STORE r8, r10
    ADD r8, r1

    ; Convert ticks to decimal
    CALL date_utoa

    ; Null terminate
    LDI r10, 0
    STORE r8, r10

    ; Display
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r11, 4
    LDI r5, 0x2400
    TEXT r11, r1, r5

    POP r4
    POP r3
    POP r2
    POP r12
    JMP exec_done

date_utoa:
    ; Convert r15 to decimal, write to buffer at r8
    PUSH r12
    PUSH r2
    PUSH r3
    PUSH r4

    MOV r4, r8

    ; Handle 0
    JNZ r15, date_nonzero
    LDI r10, 48
    STORE r8, r10
    LDI r1, 1
    ADD r8, r1
    POP r4
    POP r3
    POP r2
    POP r12
    RET

date_nonzero:
    ; Write digits in reverse at 0x2600
    LDI r3, 0x2600
    LDI r2, 0

date_div:
    JZ r15, date_rev
    LDI r1, 10
    DIV r15, r1
    LDI r1, 48
    ADD r10, r1
    STORE r3, r10
    LDI r1, 1
    ADD r3, r1
    ADD r2, r1
    JMP date_div

date_rev:
    JZ r2, date_done
    LDI r1, 1
    SUB r2, r1
    LDI r3, 0x2600
    ADD r3, r2
    LOAD r10, r3
    STORE r4, r10
    LDI r1, 1
    ADD r4, r1
    JMP date_rev

date_done:
    MOV r8, r4
    POP r4
    POP r3
    POP r2
    POP r12
    RET

do_exec:
    ; Execute external program via EXEC
    ; Command name at 0x0400
    LDI r1, 0x0400
    EXEC r1               ; r10 = PID or error
    ; Check for error
    LDI r11, 0xFFFFFFFF
    CMP r10, r11
    JZ r10, exec_error

    ; Save PID
    LDI r0, 0x1202
    STORE r0, r10

    ; Wait for child to complete
exec_wait:
    LDI r1, 0x1202
    LOAD r1, r0
    WAITPID r1
    JZ r10, exec_wait     ; still running

    ; Check for pipe mode
    LDI r0, 0x1207
    LOAD r10, r0
    LDI r1, 1
    CMP r10, r1
    JZ r10, exec_pipe

    JMP exec_done

exec_pipe:
    ; Execute second command from pipe buffer
    LDI r1, 0x1400
    EXEC r1
    LDI r0, 0x1202
    STORE r0, r10
exec_pipe_wait:
    LDI r1, 0x1202
    LOAD r1, r0
    WAITPID r1
    JZ r10, exec_pipe_wait
    JMP exec_done

exec_error:
    ; Display "command not found"
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r10, 12
    ADD r1, r10
    STORE r0, r1
    LDI r5, not_found_msg
    LDI r11, 4
    TEXT r11, r1, r5
    JMP exec_done

; ═══════════════════════════════════════════════════════════════
; Data section
; ═══════════════════════════════════════════════════════════════
.org 0x1A00

prompt_str:
    ; "> " stored as ASCII bytes
    ; 62 = '>', 32 = ' ', 0 = null
    .byte 62
    .byte 32
    .byte 0

.org 0x1A10

help_text:
    .byte 104 ; h
    .byte 101 ; e
    .byte 108 ; l
    .byte 112 ; p
    .byte 58  ; :
    .byte 32  ; space
    .byte 101 ; e
    .byte 99  ; c
    .byte 104 ; h
    .byte 111 ; o
    .byte 32  ; space
    .byte 108 ; l
    .byte 115 ; s
    .byte 32  ; space
    .byte 99  ; c
    .byte 97  ; a
    .byte 116 ; t
    .byte 32  ; space
    .byte 101 ; e
    .byte 100  ; d
    .byte 105 ; i
    .byte 116 ; t
    .byte 32  ; space
    .byte 115 ; s
    .byte 97  ; a
    .byte 118 ; v
    .byte 101 ; e
    .byte 32  ; space
    .byte 112 ; p
    .byte 115  ; s
    .byte 32  ; space
    .byte 107 ; k
    .byte 105 ; i
    .byte 108 ; l
    .byte 108 ; l
    .byte 32  ; space
    .byte 114 ; r
    .byte 109 ; m
    .byte 32  ; space
    .byte 99  ; c
    .byte 112 ; p
    .byte 32  ; space
    .byte 99  ; c
    .byte 108 ; l
    .byte 101 ; e
    .byte 97  ; a
    .byte 114 ; r
    .byte 32  ; space
    .byte 101 ; e
    .byte 120 ; x
    .byte 112 ; p
    .byte 111 ; o
    .byte 114 ; r
    .byte 116 ; t
    .byte 32  ; space
    .byte 104 ; h
    .byte 121 ; y
    .byte 112 ; p
    .byte 101 ; e
    .byte 114 ; r
    .byte 118 ; v
    .byte 105 ; i
    .byte 115 ; s
    .byte 111 ; o
    .byte 114 ; r
    .byte 32  ; space
    .byte 103 ; g
    .byte 114 ; r
    .byte 101 ; e
    .byte 112 ; p
    .byte 32  ; space
    .byte 104 ; h
    .byte 101 ; e
    .byte 97  ; a
    .byte 100 ; d
    .byte 32  ; space
    .byte 116 ; t
    .byte 97  ; a
    .byte 105 ; i
    .byte 108 ; l
    .byte 32  ; space
    .byte 119 ; w
    .byte 99  ; c
    .byte 32  ; space
    .byte 100 ; d
    .byte 97  ; a
    .byte 116 ; t
    .byte 101 ; e
    .byte 0

; Data blocks reordered for monotonically increasing .org addresses
; (original kill_msg was at 0x1AD0, moved to 0x1AF0 to fix backward .org)

.org 0x1A80

export_msg:
    .byte 101 ; e
    .byte 120 ; x
    .byte 112 ; p
    .byte 111 ; o
    .byte 114 ; r
    .byte 116 ; t
    .byte 58  ; :
    .byte 32  ; space
    .byte 115 ; s
    .byte 101 ; e
    .byte 116  ; t
    .byte 0

.org 0x1AA0

not_found_msg:
    .byte 99  ; c
    .byte 111 ; o
    .byte 109 ; m
    .byte 109 ; m
    .byte 97  ; a
    .byte 110 ; n
    .byte 100 ; d
    .byte 32  ; space
    .byte 110 ; n
    .byte 111 ; o
    .byte 116 ; t
    .byte 32  ; space
    .byte 102 ; f
    .byte 111 ; o
    .byte 117 ; u
    .byte 110 ; n
    .byte 100 ; d
    .byte 0

.org 0x1AC0

hypervisor_usage_msg:
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; g
    .byte 101 ; e
    .byte 58  ; :
    .byte 32  ; space
    .byte 104 ; h
    .byte 121 ; y
    .byte 112 ; p
    .byte 101 ; e
    .byte 114 ; r
    .byte 118 ; v
    .byte 105 ; i
    .byte 115 ; s
    .byte 111 ; o
    .byte 114 ; r
    .byte 32  ; space
    .byte 97  ; a
    .byte 114 ; r
    .byte 99  ; c
    .byte 104 ; h
    .byte 61  ; =
    .byte 60  ; <
    .byte 97  ; a
    .byte 114 ; r
    .byte 99  ; c
    .byte 104 ; h
    .byte 62  ; >
    .byte 32  ; space
    .byte 107 ; k
    .byte 101 ; e
    .byte 114 ; r
    .byte 110 ; n
    .byte 101 ; e
    .byte 108 ; l
    .byte 61  ; =
    .byte 60  ; <
    .byte 102 ; f
    .byte 105 ; i
    .byte 108 ; l
    .byte 101 ; e
    .byte 62  ; >
    .byte 0

.org 0x1AF0

kill_msg:
    .byte 107 ; k
    .byte 105 ; i
    .byte 108 ; l
    .byte 108 ; l
    .byte 58  ; :
    .byte 32  ; space
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; e
    .byte 32  ; space
    .byte 107 ; k
    .byte 105 ; i
    .byte 108 ; l
    .byte 32  ; space
    .byte 60  ; <
    .byte 112 ; p
    .byte 105 ; i
    .byte 100 ; d
    .byte 62  ; >
    .byte 0

.org 0x1B10

hypervisor_err_msg:
hypervisor_err_msg:
    .byte 104 ; h
    .byte 121 ; y
    .byte 112 ; p
    .byte 101 ; e
    .byte 114 ; r
    .byte 118 ; v
    .byte 105 ; i
    .byte 115 ; s
    .byte 111 ; o
    .byte 114 ; r
    .byte 58  ; :
    .byte 32  ; space
    .byte 102 ; f
    .byte 97  ; a
    .byte 105 ; i
    .byte 108 ; l
    .byte 101 ; e
    .byte 100 ; d
    .byte 0

.org 0x1C00

; Config buffer for hypervisor arguments is at 0x1B00 (hardcoded in do_hypervisor).

grep_err_msg:
    .byte 103 ; g
    .byte 114 ; r
    .byte 101 ; e
    .byte 112 ; p
    .byte 58  ; :
    .byte 32  ; space
    .byte 110 ; n
    .byte 111 ; o
    .byte 32  ; space
    .byte 109 ; m
    .byte 97  ; a
    .byte 116 ; c
    .byte 104 ; h
    .byte 0

head_usage_msg:
    .byte 104 ; h
    .byte 101 ; e
    .byte 97  ; a
    .byte 100 ; d
    .byte 58  ; :
    .byte 32  ; space
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; g
    .byte 101 ; e
    .byte 0

tail_usage_msg:
    .byte 116 ; t
    .byte 97  ; a
    .byte 105 ; i
    .byte 108 ; l
    .byte 58  ; :
    .byte 32  ; space
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; g
    .byte 101 ; e
    .byte 0

wc_usage_msg:
    .byte 119 ; w
    .byte 99  ; c
    .byte 58  ; :
    .byte 32  ; space
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; g
    .byte 101 ; e
    .byte 0

hypervisor_ok_msg:
    .byte 104 ; h
    .byte 121 ; y
    .byte 112 ; p
    .byte 101 ; e
    .byte 114 ; r
    .byte 118 ; v
    .byte 105 ; i
    .byte 115 ; s
    .byte 111 ; o
    .byte 114 ; r
    .byte 58  ; :
    .byte 32  ; space
    .byte 115 ; s
    .byte 116 ; t
    .byte 97  ; a
    .byte 114 ; r
    .byte 116 ; t
    .byte 101 ; e
    .byte 100 ; d
    .byte 0

.org 0x1D00

edit_ok_msg:
    .byte 91  ; [
    .byte 101 ; e
    .byte 100 ; d
    .byte 105 ; i
    .byte 116 ; t
    .byte 58  ; :
    .byte 32  ; space
    .byte 111 ; o
    .byte 107 ; k
    .byte 93  ; ]
    .byte 0

.org 0x1D10

edit_usage_msg:
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; g
    .byte 101 ; e
    .byte 58  ; :
    .byte 32  ; space
    .byte 101 ; e
    .byte 100 ; d
    .byte 105 ; i
    .byte 116 ; t
    .byte 32  ; space
    .byte 60  ; <
    .byte 102 ; f
    .byte 105 ; i
    .byte 108 ; l
    .byte 101 ; e
    .byte 62  ; >
    .byte 0

.org 0x1D30

edit_err_msg:
    .byte 101 ; e
    .byte 100 ; d
    .byte 105 ; i
    .byte 116 ; t
    .byte 58  ; :
    .byte 32  ; space
    .byte 110 ; n
    .byte 111 ; o
    .byte 116 ; t
    .byte 32  ; space
    .byte 102 ; f
    .byte 111 ; o
    .byte 117 ; u
    .byte 110 ; n
    .byte 100 ; d
    .byte 0

.org 0x1D50

save_ok_msg:
    .byte 115 ; s
    .byte 97  ; a
    .byte 118 ; v
    .byte 101 ; e
    .byte 100 ; d
    .byte 0

.org 0x1D60

save_empty_msg:
    .byte 115 ; s
    .byte 97  ; a
    .byte 118 ; v
    .byte 101 ; e
    .byte 58  ; :
    .byte 32  ; space
    .byte 101 ; e
    .byte 109 ; m
    .byte 112 ; p
    .byte 116 ; t
    .byte 121 ; y
    .byte 0

.org 0x1D80

save_usage_msg:
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; g
    .byte 101 ; e
    .byte 58  ; :
    .byte 32  ; space
    .byte 115 ; s
    .byte 97  ; a
    .byte 118 ; v
    .byte 101 ; e
    .byte 32  ; space
    .byte 60  ; <
    .byte 102 ; f
    .byte 105 ; i
    .byte 108 ; l
    .byte 101 ; e
    .byte 62  ; >
    .byte 0

.org 0x1DA0

save_err_msg:
    .byte 115 ; s
    .byte 97  ; a
    .byte 118 ; v
    .byte 101 ; e
    .byte 58  ; :
    .byte 32  ; space
    .byte 101 ; e
    .byte 114 ; r
    .byte 114 ; r
    .byte 111 ; o
    .byte 114 ; r
    .byte 0

.org 0x1DC0

grep_usage:
    .byte 103 ; g
    .byte 114 ; r
    .byte 101 ; e
    .byte 112 ; p
    .byte 58  ; :
    .byte 32  ; space
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; g
    .byte 101 ; e
    .byte 32  ; space
    .byte 60  ; <
    .byte 112 ; p
    .byte 97  ; a
    .byte 116 ; t
    .byte 62  ; >
    .byte 32  ; space
    .byte 60  ; <
    .byte 102 ; f
    .byte 105 ; i
    .byte 108 ; l
    .byte 101 ; e
    .byte 62  ; >
    .byte 0

grep_no_match:
    .byte 40  ; (
    .byte 110 ; n
    .byte 111 ; o
    .byte 32  ; space
    .byte 109 ; m
    .byte 97  ; a
    .byte 116 ; t
    .byte 99  ; c
    .byte 104 ; h
    .byte 41  ; )
    .byte 0

head_usage:
    .byte 104 ; h
    .byte 101 ; e
    .byte 97  ; a
    .byte 100 ; d
    .byte 58  ; :
    .byte 32  ; space
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; g
    .byte 101 ; e
    .byte 32  ; space
    .byte 60  ; <
    .byte 110 ; n
    .byte 62  ; >
    .byte 32  ; space
    .byte 60  ; <
    .byte 102 ; f
    .byte 105 ; i
    .byte 108 ; l
    .byte 101 ; e
    .byte 62  ; >
    .byte 0

tail_usage:
    .byte 116 ; t
    .byte 97  ; a
    .byte 105 ; i
    .byte 108 ; l
    .byte 58  ; :
    .byte 32  ; space
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; g
    .byte 101 ; e
    .byte 32  ; space
    .byte 60  ; <
    .byte 110 ; n
    .byte 62  ; >
    .byte 32  ; space
    .byte 60  ; <
    .byte 102 ; f
    .byte 105 ; i
    .byte 108 ; l
    .byte 101 ; e
    .byte 62  ; >
    .byte 0

wc_usage:
    .byte 119 ; w
    .byte 99  ; c
    .byte 58  ; :
    .byte 32  ; space
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; g
    .byte 101 ; e
    .byte 32  ; space
    .byte 60  ; <
    .byte 102 ; f
    .byte 105 ; i
    .byte 108 ; l
    .byte 101 ; e
    .byte 62  ; >
    .byte 0

wc_none:
    .byte 48  ; 0
    .byte 32  ; space
    .byte 48  ; 0
    .byte 32  ; space
    .byte 48  ; 0
    .byte 32  ; space
    .byte 60  ; <
    .byte 102 ; f
    .byte 105 ; i
    .byte 108 ; l
    .byte 101 ; e
    .byte 62  ; >
    .byte 0

date_str:
    .byte 117 ; u
    .byte 112 ; p
    .byte 116 ; t
    .byte 105 ; i
    .byte 109 ; m
    .byte 101 ; e
    .byte 58  ; :
    .byte 32  ; space
    .byte 0

date_sec:
    .byte 32  ; space
    .byte 115 ; s
    .byte 101 ; e
    .byte 99  ; c
    .byte 111 ; o
    .byte 110 ; n
    .byte 100 ; d
    .byte 115 ; s
    .byte 0

date_nl:
    .byte 32  ; space
    .byte 40  ; (
    .byte 51  ; 3
    .byte 54  ; 6
    .byte 48  ; 0
    .byte 48  ; 0
    .byte 47 ; /
    .byte 54  ; 6
    .byte 48  ; 0
    .byte 48  ; 0
    .byte 32  ; space
    .byte 109 ; m
    .byte 97  ; a
    .byte 120 ; x
    .byte 41  ; )
    .byte 0

HALT