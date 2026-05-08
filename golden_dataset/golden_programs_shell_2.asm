; DESCRIPTION: A red rectangle centered at the screen with fixed size.

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
    LDI r6, 0
    FILL r6               ; clear screen to black
    LDI r15, 0x1201
    LDI r6, 20
    STORE r15, r6          ; prompt y starts at line 20
    LDI r15, 0x1207
    LDI r6, 0
    STORE r15, r6          ; pipe mode = 0
    LDI r15, 0x1205
    STORE r15, r6          ; redirect mode = 0

    ; Write help text to buffer at 0x1300
    LDI r15, 0x1300
    LDI r6, 104       ; h
    STORE r15, r6
    LDI r15, 0x1301
    LDI r6, 101       ; e
    STORE r15, r6
    LDI r15, 0x1302
    LDI r6, 108       ; l
    STORE r15, r6
    LDI r15, 0x1303
    LDI r6, 112       ; p
    STORE r15, r6
    LDI r15, 0x1304
    LDI r6, 0
    STORE r15, r6

; ═══════════════════════════════════════════════════════════════
; Main loop: display prompt, read command, execute
; ═══════════════════════════════════════════════════════════════
main_loop:
    ; Display prompt "> " at current y position
    LDI r15, 0x1201         ; r15 = prompt y addr
    LOAD r13, r15            ; r13 = y position
    LDI r5, 2              ; x = 2
    LDI r10, prompt_str
    TEXT r5, r13, r10

    ; Read a line of input
    LDI r6, 0x0200         ; buf addr
    LDI r13, 200            ; max len
    LDI r5, 0x1200         ; pos addr
    LDI r15, 0x1200
    LDI r10, 0
    STORE r15, r10           ; reset position

readln_loop:
    READLN r6, r13, r5
    CMP r6, r10             ; r6 == 0 means still reading
    JZ r6, readln_loop

    ; r6 > 0 means line complete (Enter pressed)
    ; Check if line is empty
    JZ r6, main_loop       ; empty line, loop

    ; Parse and execute the command
    CALL parse_command
    CALL execute_command

    ; Scroll down prompt position
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13

    ; If y > 240, scroll screen and reset
    LDI r6, 240
    CMP r13, r6
    BLT r13, main_loop
    LDI r6, 10
    SCROLL r6
    LDI r13, 20
    STORE r15, r13
    JMP main_loop

; ═══════════════════════════════════════════════════════════════
; parse_command -- extract command name and argument from input
; Input: command buffer at 0x0200
; Output: command at 0x0400, argument at 0x0600
; Also sets pipe mode (0x1207) and redirect mode (0x1205)
; ═══════════════════════════════════════════════════════════════
parse_command:
    PUSH r9
    PUSH r2
    PUSH r12
    PUSH r1

    ; Reset pipe mode and redirect mode
    LDI r15, 0x1207
    LDI r6, 0
    STORE r15, r6
    LDI r15, 0x1205
    STORE r15, r6

    ; Skip leading spaces
    LDI r9, 0x0200       ; src pointer
skip_spaces:
    LOAD r6, r9
    JZ r6, parse_done      ; empty string
    LDI r13, 32
    CMP r6, r13
    JZ r6, skip_spaces     ; skip space

    ; Copy command name until space or null
    LDI r2, 0x0400       ; dest for command name
copy_cmd:
    LOAD r6, r9
    JZ r6, parse_cmd_done
    LDI r13, 32
    CMP r6, r13
    JZ r6, parse_cmd_done
    ; Check for pipe character '|' (124)
    LDI r13, 124
    CMP r6, r13
    JZ r6, parse_pipe_found
    ; Check for '>' (62)
    LDI r13, 62
    CMP r6, r13
    JZ r6, parse_redirect_out
    ; Check for '<' (60)
    LDI r13, 60
    CMP r6, r13
    JZ r6, parse_redirect_in
    STORE r2, r6
    ADD r9, r10            ; r10 is still 0 from earlier... let's use r13
    ; Actually need to increment properly
    LDI r13, 1
    ADD r9, r13
    LDI r13, 1
    ADD r2, r13
    JMP copy_cmd

parse_cmd_done:
    ; Null terminate command
    LDI r6, 0
    STORE r2, r6

    ; Skip spaces after command
    LOAD r6, r9
    JZ r6, parse_arg_done  ; no argument
skip_arg_spaces:
    LOAD r6, r9
    LDI r13, 32
    CMP r6, r13
    JZ r6, skip_arg_spaces_inc
    JMP copy_arg_start
skip_arg_spaces_inc:
    LDI r13, 1
    ADD r9, r13
    JMP skip_arg_spaces

copy_arg_start:
    ; Copy argument until null
    LDI r2, 0x0600       ; dest for argument
copy_arg:
    LOAD r6, r9
    JZ r6, parse_arg_done
    ; Check for pipe
    LDI r13, 124
    CMP r6, r13
    JZ r6, parse_pipe_found_arg
    ; Check for redirect
    LDI r13, 62
    CMP r6, r13
    JZ r6, parse_redirect_out_arg
    LDI r13, 60
    CMP r6, r13
    JZ r6, parse_redirect_in_arg
    STORE r2, r6
    LDI r13, 1
    ADD r9, r13
    ADD r2, r13
    JMP copy_arg

parse_arg_done:
    LDI r6, 0
    STORE r2, r6
    JMP parse_done

parse_pipe_found:
    ; Null terminate command
    LDI r6, 0
    STORE r2, r6
    ; Set pipe mode
    LDI r15, 0x1207
    LDI r6, 1
    STORE r15, r6
    ; Skip pipe char and spaces
    LDI r13, 1
    ADD r9, r13
skip_pipe_spaces:
    LOAD r6, r9
    LDI r13, 32
    CMP r6, r13
    JZ r6, skip_pipe_spaces_inc
    JMP copy_pipe_cmd
skip_pipe_spaces_inc:
    LDI r13, 1
    ADD r9, r13
    JMP skip_pipe_spaces

copy_pipe_cmd:
    ; Copy second command to pipe buffer at 0x1400
    LDI r2, 0x1400
copy_pipe_loop:
    LOAD r6, r9
    JZ r6, parse_pipe_done
    STORE r2, r6
    LDI r13, 1
    ADD r9, r13
    ADD r2, r13
    JMP copy_pipe_loop
parse_pipe_done:
    LDI r6, 0
    STORE r2, r6
    JMP parse_done

parse_pipe_found_arg:
    ; Null terminate argument
    LDI r6, 0
    STORE r2, r6
    ; Set pipe mode
    LDI r15, 0x1207
    LDI r6, 1
    STORE r15, r6
    ; Skip pipe char and spaces
    LDI r13, 1
    ADD r9, r13
skip_pipe_spaces2:
    LOAD r6, r9
    LDI r13, 32
    CMP r6, r13
    JZ r6, skip_pipe_spaces2_inc
    JMP copy_pipe_cmd2
skip_pipe_spaces2_inc:
    LDI r13, 1
    ADD r9, r13
    JMP skip_pipe_spaces2

copy_pipe_cmd2:
    LDI r2, 0x1400
copy_pipe_loop2:
    LOAD r6, r9
    JZ r6, parse_done2
    STORE r2, r6
    LDI r13, 1
    ADD r9, r13
    ADD r2, r13
    JMP copy_pipe_loop2
parse_done2:
    LDI r6, 0
    STORE r2, r6
    JMP parse_done

parse_redirect_out:
    ; Null terminate command
    LDI r6, 0
    STORE r2, r6
    ; Check for >> (append)
    LDI r13, 1
    ADD r9, r13
    LOAD r6, r9
    LDI r13, 62
    CMP r6, r13
    JZ r6, redirect_append
    ; Single > = write (mode 1)
    LDI r15, 0x1205
    LDI r6, 1
    STORE r15, r6
    JMP skip_redir_spaces
redirect_append:
    LDI r15, 0x1205
    LDI r6, 2
    STORE r15, r6
    LDI r13, 1
    ADD r9, r13
    JMP skip_redir_spaces

parse_redirect_out_arg:
    ; Null terminate argument
    LDI r6, 0
    STORE r2, r6
    LDI r13, 1
    ADD r9, r13
    LOAD r6, r9
    LDI r13, 62
    CMP r6, r13
    JZ r6, redirect_append2
    LDI r15, 0x1205
    LDI r6, 1
    STORE r15, r6
    JMP skip_redir_spaces
redirect_append2:
    LDI r15, 0x1205
    LDI r6, 2
    STORE r15, r6
    LDI r13, 1
    ADD r9, r13
    JMP skip_redir_spaces

parse_redirect_in:
    LDI r6, 0
    STORE r2, r6
    LDI r15, 0x1205
    LDI r6, 3
    STORE r15, r6
    LDI r13, 1
    ADD r9, r13
    JMP skip_redir_spaces

parse_redirect_in_arg:
    LDI r6, 0
    STORE r2, r6
    LDI r15, 0x1205
    LDI r6, 3
    STORE r15, r6
    LDI r13, 1
    ADD r9, r13
    JMP skip_redir_spaces

skip_redir_spaces:
    LOAD r6, r9
    LDI r13, 32
    CMP r6, r13
    JZ r6, skip_redir_spaces_inc
    JMP copy_redir_file
skip_redir_spaces_inc:
    LDI r13, 1
    ADD r9, r13
    JMP skip_redir_spaces

copy_redir_file:
    ; Copy redirect filename to argument buffer (0x0600)
    LDI r2, 0x0600
copy_redir_loop:
    LOAD r6, r9
    JZ r6, parse_done
    STORE r2, r6
    LDI r13, 1
    ADD r9, r13
    ADD r2, r13
    JMP copy_redir_loop

parse_done:
    POP r1
    POP r12
    POP r2
    POP r9
    RET

; ═══════════════════════════════════════════════════════════════
; execute_command -- dispatch to built-in or EXEC
; Command at 0x0400, argument at 0x0600
; ═══════════════════════════════════════════════════════════════
execute_command:
    PUSH r9
    PUSH r2
    PUSH r12

    ; Check for empty command
    LDI r15, 0x0400
    LOAD r6, r15
    JZ r6, exec_done

    ; Compare command with known built-ins
    ; help
    CALL cmd_is_help
    JNZ r6, do_help

    ; echo
    CALL cmd_is_echo
    JNZ r6, do_echo

    ; ls
    CALL cmd_is_ls
    JNZ r6, do_ls

    ; cat
    CALL cmd_is_cat
    JNZ r6, do_cat

    ; ps
    CALL cmd_is_ps
    JNZ r6, do_ps

    ; kill
    CALL cmd_is_kill
    JNZ r6, do_kill

    ; export
    CALL cmd_is_export
    JNZ r6, do_export

    ; clear
    CALL cmd_is_clear
    JNZ r6, do_clear

    ; rm
    CALL cmd_is_rm
    JNZ r6, do_rm

    ; cp
    CALL cmd_is_cp
    JNZ r6, do_cp

    ; hypervisor
    CALL cmd_is_hypervisor
    JNZ r6, do_hypervisor

    ; edit
    CALL cmd_is_edit
    JNZ r6, do_edit

    ; save
    CALL cmd_is_save
    JNZ r6, do_save

    ; grep
    CALL cmd_is_grep
    JNZ r6, do_grep

    ; head
    CALL cmd_is_head
    JNZ r6, do_head

    ; tail
    CALL cmd_is_tail
    JNZ r6, do_tail

    ; wc
    CALL cmd_is_wc
    JNZ r6, do_wc

    ; date
    CALL cmd_is_date
    JNZ r6, do_date

    ; Not a built-in -- try EXEC
    JMP do_exec

exec_done:
    POP r12
    POP r2
    POP r9
    RET

; ── Command comparison helpers ────────────────────────────────
; Each sets r6=1 if match, r6=0 if not

cmd_is_help:
    LDI r15, 0x0400
    LDI r6, 104       ; h
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cmd_help_n
    LDI r15, 0x0401
    LDI r6, 101       ; e
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cmd_help_n
    LDI r15, 0x0402
    LDI r6, 108       ; l
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cmd_help_n
    LDI r15, 0x0403
    LDI r6, 112       ; p
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cmd_help_n
    LDI r15, 0x0404
    LDI r6, 0
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cmd_help_n
    LDI r6, 1
    RET
cmd_help_n:
    LDI r6, 0
    RET

cmd_is_echo:
    LDI r15, 0x0400
    LDI r6, 101       ; e
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0401
    LDI r6, 99        ; c
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0402
    LDI r6, 104       ; h
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0403
    LDI r6, 111       ; o
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0404
    LDI r6, 0
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r6, 1
    RET

cmd_is_ls:
    LDI r15, 0x0400
    LDI r6, 108       ; l
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0401
    LDI r6, 115       ; s
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0402
    LDI r6, 0
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r6, 1
    RET

cmd_is_cat:
    LDI r15, 0x0400
    LDI r6, 99        ; c
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0401
    LDI r6, 97        ; a
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0402
    LDI r6, 116       ; t
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0403
    LDI r6, 0
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r6, 1
    RET

cmd_is_ps:
    LDI r15, 0x0400
    LDI r6, 112       ; p
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0401
    LDI r6, 115       ; s
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0402
    LDI r6, 0
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r6, 1
    RET

cmd_is_kill:
    LDI r15, 0x0400
    LDI r6, 107       ; k
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0401
    LDI r6, 105       ; i
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0402
    LDI r6, 108       ; l
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0403
    LDI r6, 108       ; l
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0404
    LDI r6, 0
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r6, 1
    RET

cmd_is_export:
    LDI r15, 0x0400
    LDI r6, 101       ; e
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0401
    LDI r6, 120       ; x
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0402
    LDI r6, 112       ; p
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0403
    LDI r6, 111       ; o
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0404
    LDI r6, 114       ; r
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0405
    LDI r6, 116       ; t
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0406
    LDI r6, 0
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r6, 1
    RET

cmd_is_clear:
    LDI r15, 0x0400
    LDI r6, 99        ; c
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0401
    LDI r6, 108       ; l
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0402
    LDI r6, 101       ; e
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0403
    LDI r6, 97        ; a
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0404
    LDI r6, 114       ; r
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0405
    LDI r6, 0
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r6, 1
    RET

cmd_is_rm:
    LDI r15, 0x0400
    LDI r6, 114       ; r
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0401
    LDI r6, 109       ; m
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0402
    LDI r6, 0
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r6, 1
    RET

cmd_is_cp:
    LDI r15, 0x0400
    LDI r6, 99        ; c
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0401
    LDI r6, 112       ; p
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0402
    LDI r6, 0
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r6, 1
    RET

cmd_is_hypervisor:
    LDI r15, 0x0400
    LDI r6, 104       ; h
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0401
    LDI r6, 121       ; y
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0402
    LDI r6, 112       ; p
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0403
    LDI r6, 101       ; e
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0404
    LDI r6, 114       ; r
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0405
    LDI r6, 118       ; v
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0406
    LDI r6, 105       ; i
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0407
    LDI r6, 115       ; s
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0408
    LDI r6, 111       ; o
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0409
    LDI r6, 114       ; r
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x040A
    LDI r6, 0
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r6, 1
    RET

cmd_is_edit:
    LDI r15, 0x0400
    LDI r6, 101       ; e
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0401
    LDI r6, 100       ; d
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0402
    LDI r6, 105       ; i
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0403
    LDI r6, 116       ; t
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0404
    LDI r6, 0
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r6, 1
    RET

cmd_is_save:
    LDI r15, 0x0400
    LDI r6, 115       ; s
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0401
    LDI r6, 97        ; a
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0402
    LDI r6, 118       ; v
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0403
    LDI r6, 101       ; e
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0404
    LDI r6, 0
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r6, 1
    RET

cmd_is_grep:
    LDI r15, 0x0400
    LDI r6, 103       ; g
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0401
    LDI r6, 114       ; r
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0402
    LDI r6, 101       ; e
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0403
    LDI r6, 112       ; p
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0404
    LDI r6, 0
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r6, 1
    RET

cmd_is_head:
    LDI r15, 0x0400
    LDI r6, 104       ; h
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0401
    LDI r6, 101       ; e
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0402
    LDI r6, 97        ; a
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0403
    LDI r6, 100       ; d
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0404
    LDI r6, 0
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r6, 1
    RET

cmd_is_tail:
    LDI r15, 0x0400
    LDI r6, 116       ; t
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0401
    LDI r6, 97        ; a
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0402
    LDI r6, 105       ; i
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0403
    LDI r6, 108       ; l
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0404
    LDI r6, 0
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r6, 1
    RET

cmd_is_wc:
    LDI r15, 0x0400
    LDI r6, 119       ; w
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0401
    LDI r6, 99        ; c
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0402
    LDI r6, 0
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r6, 1
    RET

cmd_is_date:
    LDI r15, 0x0400
    LDI r6, 100       ; d
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0401
    LDI r6, 97        ; a
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0402
    LDI r6, 116       ; t
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0403
    LDI r6, 101       ; e
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r15, 0x0404
    LDI r6, 0
    LOAD r13, r15
    CMP r6, r13
    JNZ r6, cno
    LDI r6, 1
    RET

cno:
    LDI r6, 0
    RET

; ── Built-in command implementations ──────────────────────────

do_help:
    ; Display available commands
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r5, 2
    LDI r10, help_text
    TEXT r5, r13, r10
    JMP exec_done

do_echo:
    ; Print the argument
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, 0x0600
    TEXT r5, r13, r10
    JMP exec_done

do_ls:
    ; List files using LS opcode
    LDI r13, 0x0800
    LS r13                  ; list files into buffer at 0x0800
    ; r6 = number of files
    ; Display each filename
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, 0x0800
    TEXT r5, r13, r10
    JMP exec_done

do_cat:
    ; Read and display a file
    ; Argument (filename) at 0x0600
    LDI r13, 0x0600       ; filename addr
    LDI r5, 0            ; mode = read
    OPEN r13, r5           ; r6 = fd
    ; Check for error
    LDI r13, 0xFFFFFFFF
    CMP r6, r13
    JZ r6, exec_done      ; error, skip

    MOV r7, r6            ; save fd in r7
    LDI r10, 0x1000        ; read buffer
    LDI r14, 200           ; max bytes
    READ r7, r10, r14       ; r6 = bytes read
    ; Null terminate
    LDI r11, 200
    CMP r6, r11
    BLT r6, cat_term_ok
    LDI r6, 200
cat_term_ok:
    LDI r11, 0x1000
    ADD r6, r11
    LDI r4, 0
    STORE r6, r4
    ; Display
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, 0x1000
    TEXT r5, r13, r10
    CLOSE r7
    JMP exec_done

do_ps:
    ; Display process info
    ; For now, show PID count and current PID
    GETPID
    MOV r7, r6            ; save our PID
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    ; Show "PID: N" using register value
    ; Write PID as text at 0x1500
    LDI r15, 0x1500
    LDI r6, 80            ; P
    STORE r15, r6
    LDI r15, 0x1501
    LDI r6, 73            ; I
    STORE r15, r6
    LDI r15, 0x1502
    LDI r6, 68            ; D
    STORE r15, r6
    LDI r15, 0x1503
    LDI r6, 58            ; :
    STORE r15, r6
    LDI r15, 0x1504
    LDI r6, 32            ; space
    STORE r15, r6
    ; Convert PID to decimal digits
    LDI r15, 0x1505
    LDI r13, 48            ; '0'
    ADD r6, r13
    STORE r15, r6
    LDI r15, 0x1506
    LDI r6, 0
    STORE r15, r6
    LDI r5, 4
    LDI r10, 0x1500
    TEXT r5, r13, r10
    JMP exec_done

do_kill:
    ; Kill a process by PID
    ; Argument should be a number -- simplified: just echo "kill"
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r10, kill_msg
    LDI r5, 4
    TEXT r5, r13, r10
    JMP exec_done

do_export:
    ; Set environment variable
    ; Argument format: KEY=VALUE
    ; For simplicity, just acknowledge
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r10, export_msg
    LDI r5, 4
    TEXT r5, r13, r10
    JMP exec_done

do_clear:
    LDI r6, 0
    FILL r6
    LDI r15, 0x1201
    LDI r6, 20
    STORE r15, r6
    JMP exec_done

do_rm:
    ; Delete a file: rm <filename>
    ; Argument (filename) at 0x0600
    LDI r15, 0x0600
    LOAD r6, r15
    JZ r6, rm_usage
    ; Copy arg to a clean buffer at 0x1600
    LDI r12, 0x0600
    LDI r2, 0x1600
rm_copy:
    LOAD r6, r12
    JZ r6, rm_copy_done
    STORE r2, r6
    LDI r6, 1
    ADD r12, r6
    ADD r2, r6
    JMP rm_copy
rm_copy_done:
    LDI r6, 0
    STORE r2, r6      ; null terminate
    ; UNLINK r13 where r13 = 0x1600
    LDI r13, 0x1600
    UNLINK r13
    ; r6 = 0 on success, 0xFFFFFFFF on error
    LDI r13, 0xFFFFFFFF
    CMP r6, r13
    JNZ r6, rm_ok
    ; Print error
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r5, 8          ; "rm: error"
    LDI r10, 0x1700
    ; Store "rm: error" message
    LDI r15, 0x1700
    LDI r6, 114        ; r
    STORE r15, r6
    LDI r15, 0x1701
    LDI r6, 109        ; m
    STORE r15, r6
    LDI r15, 0x1702
    LDI r6, 58         ; :
    STORE r15, r6
    LDI r15, 0x1703
    LDI r6, 32         ; space
    STORE r15, r6
    LDI r15, 0x1704
    LDI r6, 101        ; e
    STORE r15, r6
    LDI r15, 0x1705
    LDI r6, 114        ; r
    STORE r15, r6
    LDI r15, 0x1706
    LDI r6, 114        ; r
    STORE r15, r6
    LDI r15, 0x1707
    LDI r6, 111        ; o
    STORE r15, r6
    LDI r15, 0x1708
    LDI r6, 114        ; r
    STORE r15, r6
    LDI r15, 0x1709
    LDI r6, 0
    STORE r15, r6
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r5, 9
    LDI r10, 0x1700
    TEXT r5, r13, r10
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    JMP exec_done
rm_ok:
    JMP exec_done
rm_usage:
    ; Print "rm <file>"
    LDI r15, 0x1700
    LDI r6, 114        ; r
    STORE r15, r6
    LDI r15, 0x1701
    LDI r6, 109        ; m
    STORE r15, r6
    LDI r15, 0x1702
    LDI r6, 32         ; space
    STORE r15, r6
    LDI r15, 0x1703
    LDI r6, 60         ; <
    STORE r15, r6
    LDI r15, 0x1704
    LDI r6, 102        ; f
    STORE r15, r6
    LDI r15, 0x1705
    LDI r6, 105        ; i
    STORE r15, r6
    LDI r15, 0x1706
    LDI r6, 108        ; l
    STORE r15, r6
    LDI r15, 0x1707
    LDI r6, 101        ; e
    STORE r15, r6
    LDI r15, 0x1708
    LDI r6, 62         ; >
    STORE r15, r6
    LDI r15, 0x1709
    LDI r6, 0
    STORE r15, r6
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r5, 9
    LDI r10, 0x1700
    TEXT r5, r13, r10
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    JMP exec_done

do_cp:
    ; Copy a file: cp <src> <dst>
    ; Arguments at 0x0600, separated by space
    ; Parse second argument from 0x0600 into 0x1800
    LDI r15, 0x0600
    LOAD r6, r15
    JZ r6, cp_usage
    ; Find space separator
    LDI r12, 0x0600
cp_find_space:
    LOAD r6, r12
    JZ r6, cp_usage    ; no space found -- need 2 args
    LDI r13, 32         ; space
    CMP r6, r13
    JZ r6, cp_found_space
    LDI r6, 1
    ADD r12, r6
    JMP cp_find_space
cp_found_space:
    ; Skip the space, copy rest to 0x1800
    LDI r6, 1
    ADD r12, r6
    LDI r2, 0x1800
cp_copy_dst:
    LOAD r6, r12
    JZ r6, cp_copy_dst_done
    STORE r2, r6
    LDI r6, 1
    ADD r12, r6
    ADD r2, r6
    JMP cp_copy_dst
cp_copy_dst_done:
    LDI r6, 0
    STORE r2, r6
    ; Null-terminate the source filename (replace space with 0)
    LDI r12, 0x0600
    LDI r2, 0x1600
cp_copy_src:
    LOAD r6, r12
    JZ r6, cp_src_done
    LDI r13, 32
    CMP r6, r13
    JZ r6, cp_src_terminate
    STORE r2, r6
    LDI r6, 1
    ADD r12, r6
    ADD r2, r6
    JMP cp_copy_src
cp_src_terminate:
    LDI r6, 0
    STORE r2, r6
    JMP cp_do_copy
cp_src_done:
    STORE r2, r6
cp_do_copy:
    ; FCOPY r13, r5 where r13=0x1600 (src), r5=0x1800 (dst)
    LDI r13, 0x1600
    LDI r5, 0x1800
    FCOPY r13, r5
    ; Check result
    LDI r13, 0xFFFFFFFF
    CMP r6, r13
    JNZ r6, cp_ok
    ; Print error
    LDI r15, 0x1700
    LDI r6, 99         ; c
    STORE r15, r6
    LDI r15, 0x1701
    LDI r6, 112        ; p
    STORE r15, r6
    LDI r15, 0x1702
    LDI r6, 58         ; :
    STORE r15, r6
    LDI r15, 0x1703
    LDI r6, 32         ; space
    STORE r15, r6
    LDI r15, 0x1704
    LDI r6, 101        ; e
    STORE r15, r6
    LDI r15, 0x1705
    LDI r6, 114        ; r
    STORE r15, r6
    LDI r15, 0x1706
    LDI r6, 114        ; r
    STORE r15, r6
    LDI r15, 0x1707
    LDI r6, 111        ; o
    STORE r15, r6
    LDI r15, 0x1708
    LDI r6, 114        ; r
    STORE r15, r6
    LDI r15, 0x1709
    LDI r6, 0
    STORE r15, r6
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r5, 9
    LDI r10, 0x1700
    TEXT r5, r13, r10
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    JMP exec_done
cp_ok:
    JMP exec_done
cp_usage:
    LDI r15, 0x1700
    LDI r6, 99         ; c
    STORE r15, r6
    LDI r15, 0x1701
    LDI r6, 112        ; p
    STORE r15, r6
    LDI r15, 0x1702
    LDI r6, 32         ; space
    STORE r15, r6
    LDI r15, 0x1703
    LDI r6, 60         ; <
    STORE r15, r6
    LDI r15, 0x1704
    LDI r6, 115        ; s
    STORE r15, r6
    LDI r15, 0x1705
    LDI r6, 114        ; r
    STORE r15, r6
    LDI r15, 0x1706
    LDI r6, 99        ; c
    STORE r15, r6
    LDI r15, 0x1707
    LDI r6, 62         ; >
    STORE r15, r6
    LDI r15, 0x1708
    LDI r6, 32         ; space
    STORE r15, r6
    LDI r15, 0x1709
    LDI r6, 60         ; <
    STORE r15, r6
    LDI r15, 0x170A
    LDI r6, 100        ; d
    STORE r15, r6
    LDI r15, 0x170B
    LDI r6, 115        ; s
    STORE r15, r6
    LDI r15, 0x170C
    LDI r6, 116        ; t
    STORE r15, r6
    LDI r15, 0x170D
    LDI r6, 62         ; >
    STORE r15, r6
    LDI r15, 0x170E
    LDI r6, 0
    STORE r15, r6
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r5, 14
    LDI r10, 0x1700
    TEXT r5, r13, r10
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    JMP exec_done

do_hypervisor:
    PUSH r2
    PUSH r12
    ; Check if argument exists
    LDI r15, 0x0600
    LOAD r6, r15
    JZ r6, hypervisor_usage

    ; Copy argument (0x0600) to config buffer (0x1B00)
    LDI r12, 0x0600       ; src
    LDI r2, 0x1B00       ; dst
hypervisor_copy:
    LOAD r6, r12
    JZ r6, hypervisor_copy_done
    STORE r2, r6
    LDI r6, 1
    ADD r12, r6
    ADD r2, r6
    JMP hypervisor_copy
hypervisor_copy_done:
    LDI r6, 0
    STORE r2, r6         ; null terminate

    ; Call HYPERVISOR with config buffer address
    LDI r6, 0x1B00
    HYPERVISOR r6

    ; Check result: 0 = success, 0xFFFFFFFF = error, 0xFFFFFFFD = missing arch
    JZ r6, hypervisor_ok
    LDI r13, 0xFFFFFFFF
    CMP r6, r13
    JZ r6, hypervisor_err
    ; Missing arch or other error
    JMP hypervisor_err

hypervisor_ok:
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    ; Display "hypervisor started" message
    LDI r5, 4
    LDI r10, hypervisor_ok_msg
    TEXT r5, r13, r10
    JMP hypervisor_done

hypervisor_usage:
    ; No argument -- show usage
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, hypervisor_usage_msg
    TEXT r5, r13, r10
    JMP hypervisor_done

hypervisor_err:
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, hypervisor_err_msg
    TEXT r5, r13, r10
    JMP hypervisor_done

hypervisor_done:
    POP r12
    POP r2
    JMP exec_done

do_edit:
    PUSH r9
    PUSH r2
    PUSH r12
    PUSH r1

    ; Check for argument
    LDI r15, 0x0600
    LOAD r6, r15
    JZ r6, edit_usage

    ; Open file for reading
    LDI r13, 0x0600       ; filename addr
    LDI r5, 0            ; mode = read
    OPEN r13, r5           ; r6 = fd
    ; Check for error
    LDI r13, 0xFFFFFFFF
    CMP r6, r13
    JZ r6, edit_err      ; file not found

    MOV r7, r6            ; save fd in r7

    ; Read file content into buffer at 0x2000
    LDI r10, 0x2000        ; read buffer (8KB, up to row 127 * 32 cols)
    LDI r14, 4096          ; max words to read
    READ r7, r10, r14       ; r6 = bytes read

    ; Close the file
    CLOSE r7

    ; Null terminate at position bytes_read
    LDI r11, 0x2000
    ADD r11, r6            ; r11 = buffer + bytes_read
    LDI r4, 0
    STORE r11, r4          ; null terminator

    ; Display file content on screen, line by line
    ; Each line is up to 32 chars, separated by newline (10) or null
    LDI r8, 0x2000       ; source pointer
    LDI r3, 4            ; y position (start near top)
    LDI r1, 0            ; line buffer index

edit_line_loop:
    LOAD r6, r8
    JZ r6, edit_done      ; null = end of file

    ; Check for newline (10)
    LDI r13, 10
    CMP r6, r13
    JZ r6, edit_newline

    ; Store char in line buffer at 0x2100 + index
    LDI r12, 0x2100
    ADD r12, r1
    STORE r12, r6

    LDI r13, 1
    ADD r8, r13           ; advance source
    ADD r1, r13           ; advance line index

    ; Check if line is 32 chars (screen width at 8px font)
    LDI r13, 32
    CMP r1, r13
    JZ r6, edit_line_full
    JMP edit_line_loop

edit_newline:
    ; Null-terminate current line
    LDI r12, 0x2100
    ADD r12, r1
    LDI r6, 0
    STORE r12, r6

    ; Display line at y position
    LDI r5, 4             ; x = 4
    LDI r10, 0x2100        ; line buffer
    TEXT r5, r3, r10      ; render text at (4, y)

    ; Advance to next line
    LDI r13, 1
    ADD r8, r13           ; skip the newline char
    ADD r3, r13           ; next y position
    LDI r1, 0            ; reset line buffer index
    JMP edit_line_loop

edit_line_full:
    ; Null-terminate
    LDI r12, 0x2100
    ADD r12, r1
    LDI r6, 0
    STORE r12, r6

    ; Display line
    LDI r5, 4
    LDI r10, 0x2100
    TEXT r5, r3, r10

    ; Next line (no source advance since char was already stored)
    LDI r13, 1
    ADD r8, r13
    ADD r3, r13
    LDI r1, 0
    JMP edit_line_loop

edit_done:
    ; Null-terminate last line if there's content
    JZ r1, edit_show_msg
    LDI r12, 0x2100
    ADD r12, r1
    LDI r6, 0
    STORE r12, r6
    LDI r5, 4
    LDI r10, 0x2100
    TEXT r5, r3, r10

edit_show_msg:
    ; Show "[edit: filename]" at bottom
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, edit_ok_msg
    TEXT r5, r13, r10
    JMP edit_cleanup

edit_usage:
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, edit_usage_msg
    TEXT r5, r13, r10
    JMP edit_cleanup

edit_err:
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, edit_err_msg
    TEXT r5, r13, r10

edit_cleanup:
    POP r1
    POP r12
    POP r2
    POP r9
    JMP exec_done

do_save:
    PUSH r9
    PUSH r2
    PUSH r12
    PUSH r1

    ; Check for argument
    LDI r15, 0x0600
    LOAD r6, r15
    JZ r6, save_usage

    ; Open file for writing (mode 1 = write/create)
    LDI r13, 0x0600       ; filename addr
    LDI r5, 1            ; mode = write
    OPEN r13, r5           ; r6 = fd
    ; Check for error
    LDI r13, 0xFFFFFFFF
    CMP r6, r13
    JZ r6, save_err      ; could not create file

    MOV r7, r6            ; save fd in r7

    ; Calculate content length from edit buffer at 0x2000
    ; Scan for null terminator
    LDI r8, 0x2000
    LDI r3, 0            ; length counter
save_scan:
    LOAD r6, r8
    JZ r6, save_scan_done
    LDI r13, 1
    ADD r8, r13
    ADD r3, r13
    JMP save_scan

save_scan_done:
    ; If nothing to save, show message
    JZ r3, save_empty

    ; Write content to file
    LDI r13, 0x2000        ; buffer addr
    MOV r5, r13             ; fd_reg = r7 already
    ; WRITE fd_reg, buf_reg, len_reg
    MOV r13, r7             ; r13 = fd
    LDI r5, 0x2000         ; buf addr
    MOV r10, r3            ; length
    WRITE r13, r5, r10       ; r6 = bytes written

    CLOSE r7               ; close file

    ; Show "[saved: N bytes]" message
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, save_ok_msg
    TEXT r5, r13, r10
    JMP save_cleanup

save_empty:
    CLOSE r7
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, save_empty_msg
    TEXT r5, r13, r10
    JMP save_cleanup

save_usage:
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, save_usage_msg
    TEXT r5, r13, r10
    JMP save_cleanup

save_err:
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, save_err_msg
    TEXT r5, r13, r10

save_cleanup:
    POP r1
    POP r12
    POP r2
    POP r9
    JMP exec_done

do_grep:
    ; grep <pattern> <file> -- search file for lines containing pattern
    ; Argument at 0x0600 is "pattern file"
    ; We need to split: first word = pattern, second word = filename
    PUSH r9
    PUSH r2
    PUSH r12
    PUSH r1
    PUSH r3
    PUSH r8

    ; Parse argument: find first space to split pattern from filename
    ; Store pattern at 0x2200, filename at 0x2300
    LDI r8, 0x0600      ; arg pointer
    LDI r3, 0x2200      ; pattern buffer
    LDI r1, 0           ; pattern length

grep_parse_pat:
    LOAD r6, r8
    JZ r6, grep_no_file   ; no space found, error
    LDI r13, 32            ; space
    CMP r6, r13
    JZ r6, grep_copy_file
    STORE r3, r6
    LDI r13, 1
    ADD r8, r13
    ADD r3, r13
    ADD r1, r13
    JMP grep_parse_pat

grep_copy_file:
    ; Skip the space
    LDI r13, 1
    ADD r8, r13
    ; Copy filename to 0x2300
    LDI r3, 0x2300

grep_copy_file_loop:
    LOAD r6, r8
    JZ r6, grep_have_file
    STORE r3, r6
    LDI r13, 1
    ADD r8, r13
    ADD r3, r13
    JMP grep_copy_file_loop

grep_have_file:
    LDI r6, 0
    STORE r3, r6         ; null terminate filename
    ; Null terminate pattern
    LDI r3, 0x2200
    ADD r3, r1
    STORE r3, r6

    ; Check pattern length > 0
    JZ r1, grep_err

    ; Open file
    LDI r13, 0x2300       ; filename addr
    LDI r5, 0            ; mode = read
    OPEN r13, r5           ; r6 = fd
    LDI r13, 0xFFFFFFFF
    CMP r6, r13
    JZ r6, grep_err

    MOV r7, r6            ; save fd

    ; Read file content into 0x2000
    LDI r10, 0x2000
    LDI r14, 400           ; max bytes to read
    READ r7, r10, r14
    CLOSE r7

    ; Null terminate at read position
    LDI r11, 0x2000
    ADD r11, r6
    LDI r4, 0
    STORE r11, r4

    ; Scan file line by line, check if each line contains the pattern
    ; Line buffer at 0x2400, max 64 chars
    ; Save file pointer at 0x2380 (pattern_len * 4 + pattern_buf end)
    ; Actually, save at 0x23FF (safe scratch)
    LDI r8, 0x2000       ; file pointer
    LDI r12, 0            ; match count

grep_line_loop:
    ; Save file pointer to scratch
    MOV r0, r8           ; r0 = saved file ptr

    LOAD r6, r8
    JZ r6, grep_done       ; end of file

    ; Copy line to buffer at 0x2400, track length
    LDI r3, 0x2400
    LDI r1, 0            ; line length

grep_copy_line:
    LOAD r6, r8
    JZ r6, grep_check_line     ; end of file, check this line
    LDI r13, 10                 ; newline
    CMP r6, r13
    JZ r6, grep_advance_nl
    STORE r3, r6
    LDI r13, 1
    ADD r8, r13
    ADD r3, r13
    ADD r1, r13
    LDI r13, 64
    CMP r1, r13
    JZ r6, grep_check_line
    JMP grep_copy_line

grep_advance_nl:
    LDI r13, 1
    ADD r8, r13             ; skip newline

grep_check_line:
    ; Null terminate line buffer
    LDI r6, 0
    STORE r3, r6

    ; Compute pattern length (scan 0x2200 for null)
    LDI r2, 0
    LDI r9, 0x2200

grep_scan_pat_len:
    LOAD r6, r9
    JZ r6, grep_have_pat_len
    LDI r13, 1
    ADD r9, r13
    ADD r2, r13
    JMP grep_scan_pat_len

grep_have_pat_len:
    ; r2 = pattern length, r1 = line length
    ; Skip if line shorter than pattern
    CMP r1, r2
    BLT r6, grep_next_line

    ; Simple substring search: check each starting position
    ; r1 - r2 = max starting position
    SUB r1, r2           ; r1 = max_start (line_len - pat_len)

grep_search_pos:
    ; r3 = current position in line (0x2400 + offset)
    ; Use offset tracking instead of absolute address comparison
    LDI r15, 0              ; search offset

grep_search_pos2:
    CMP r15, r1            ; offset vs max_start
    BGE r6, grep_next_line

    ; Compare pattern with line at offset r15
    LDI r9, 0x2400
    ADD r9, r15            ; r9 = line_base + offset
    LDI r12, 0x2200        ; pattern start
    LDI r13, 0              ; chars matched

grep_cmp_loop:
    LOAD r6, r9
    LOAD r5, r12
    CMP r6, r5
    JNZ r6, grep_no_match_here
    ; Match so far
    LDI r10, 1
    ADD r9, r10
    ADD r12, r10
    ADD r13, r10             ; count matched chars
    CMP r13, r2            ; matched vs pattern_len
    BLT r6, grep_cmp_loop
    JMP grep_found_match

grep_no_match_here:
    LDI r10, 1
    ADD r15, r10             ; advance offset
    JMP grep_search_pos2

grep_found_match:
    ; Display the matching line
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, 0x2400
    TEXT r5, r13, r10

grep_next_line:
    ; Restore file pointer from r0
    MOV r8, r0
    JMP grep_line_loop

grep_no_file:
    ; Missing filename argument
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, grep_usage
    TEXT r5, r13, r10
    JMP grep_cleanup

grep_err:
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, grep_err_msg
    TEXT r5, r13, r10
    JMP grep_cleanup

grep_done:
    POP r8
    POP r3
    POP r1
    POP r12
    POP r2
    POP r9
    JMP exec_done

grep_cleanup:
    POP r8
    POP r3
    POP r1
    POP r12
    POP r2
    POP r9
    JMP exec_done

do_head:
    ; head <file> [N] -- display first N lines (default 10)
    ; Argument at 0x0600 is "file N"
    PUSH r9
    PUSH r2
    PUSH r12
    PUSH r1
    PUSH r3
    PUSH r8

    ; Parse: filename at 0x0600, optional number after space
    ; Copy filename to 0x2200, check for trailing number
    LDI r8, 0x0600
    LDI r3, 0x2200

head_copy_name:
    LOAD r6, r8
    JZ r6, head_name_done
    LDI r13, 32
    CMP r6, r13
    JZ r6, head_parse_n
    STORE r3, r6
    LDI r13, 1
    ADD r8, r13
    ADD r3, r13
    JMP head_copy_name

head_parse_n:
    ; Skip space
    LDI r13, 1
    ADD r8, r13
    ; Parse number (single digit 1-9 for simplicity)
    LDI r2, 10           ; default N = 10
    LOAD r6, r8
    JZ r6, head_name_done  ; no number, use default
    ; Subtract '0' (48) to get digit
    LDI r13, 48
    SUB r6, r13
    ; If result is 1-9, use it; else default 10
    LDI r13, 1
    CMP r6, r13
    BLT r6, head_name_done
    LDI r13, 9
    CMP r6, r13
    BGE r6, head_name_done
    MOV r2, r6           ; use parsed N

head_name_done:
    LDI r6, 0
    STORE r3, r6         ; null terminate filename

    ; Check for empty filename
    LDI r3, 0x2200
    LOAD r6, r3
    JZ r6, head_err

    ; Open file
    LDI r13, 0x2200
    LDI r5, 0
    OPEN r13, r5
    LDI r13, 0xFFFFFFFF
    CMP r6, r13
    JZ r6, head_err

    MOV r7, r6
    LDI r10, 0x2000
    LDI r14, 400
    READ r7, r10, r14
    CLOSE r7

    ; Null terminate
    LDI r11, 0x2000
    ADD r11, r6
    LDI r4, 0
    STORE r11, r4

    ; Display first N lines
    LDI r8, 0x2000       ; file pointer
    LDI r3, 0x2400       ; line buffer
    LDI r12, 0            ; line count
    LDI r1, 0            ; chars in line

head_read_line:
    LOAD r6, r8
    JZ r6, head_done      ; end of file

    LDI r13, 10
    CMP r6, r13
    JZ r6, head_print_line

    STORE r3, r6
    LDI r13, 1
    ADD r8, r13
    ADD r3, r13
    ADD r1, r13
    LDI r13, 32
    CMP r1, r13
    BLT r6, head_read_line
    ; Line too long, print what we have
    JMP head_print_line

head_print_line:
    ; Null terminate
    LDI r6, 0
    STORE r3, r6
    ; Display
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, 0x2400
    TEXT r5, r13, r10

    ; Increment line count, check limit
    LDI r13, 1
    ADD r12, r13
    CMP r12, r2
    BGE r6, head_done

    ; Skip newline if present
    LOAD r6, r8
    LDI r13, 10
    CMP r6, r13
    JZ r6, head_skip_nl
    JMP head_reset_line

head_skip_nl:
    LDI r13, 1
    ADD r8, r13

head_reset_line:
    LDI r3, 0x2400
    LDI r1, 0
    JMP head_read_line

head_done:
    POP r8
    POP r3
    POP r1
    POP r12
    POP r2
    POP r9
    JMP exec_done

head_err:
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, head_usage_msg
    TEXT r5, r13, r10
    POP r8
    POP r3
    POP r1
    POP r12
    POP r2
    POP r9
    JMP exec_done

do_tail:
    ; tail <file> [N] -- display last N lines (default 10)
    ; Strategy: read whole file, count newlines, display last N
    PUSH r9
    PUSH r2
    PUSH r12
    PUSH r1
    PUSH r3
    PUSH r8

    ; Parse: filename at 0x0600, optional number
    LDI r8, 0x0600
    LDI r3, 0x2200

tail_copy_name:
    LOAD r6, r8
    JZ r6, tail_name_done
    LDI r13, 32
    CMP r6, r13
    JZ r6, tail_parse_n
    STORE r3, r6
    LDI r13, 1
    ADD r8, r13
    ADD r3, r13
    JMP tail_copy_name

tail_parse_n:
    LDI r13, 1
    ADD r8, r13
    LDI r2, 10           ; default N = 10
    LOAD r6, r8
    JZ r6, tail_name_done
    LDI r13, 48
    SUB r6, r13
    LDI r13, 1
    CMP r6, r13
    BLT r6, tail_name_done
    LDI r13, 9
    CMP r6, r13
    BGE r6, tail_name_done
    MOV r2, r6

tail_name_done:
    LDI r6, 0
    STORE r3, r6

    LDI r3, 0x2200
    LOAD r6, r3
    JZ r6, tail_err

    ; Open and read file
    LDI r13, 0x2200
    LDI r5, 0
    OPEN r13, r5
    LDI r13, 0xFFFFFFFF
    CMP r6, r13
    JZ r6, tail_err

    MOV r7, r6
    LDI r10, 0x2000
    LDI r14, 400
    READ r7, r10, r14
    CLOSE r7

    LDI r11, 0x2000
    ADD r11, r6
    LDI r4, 0
    STORE r11, r4

    ; Count total lines
    LDI r8, 0x2000
    LDI r12, 1            ; line count (at least 1)

tail_count_lines:
    LOAD r6, r8
    JZ r6, tail_count_done
    LDI r13, 10
    CMP r6, r13
    JNZ r6, tail_count_next
    LDI r13, 1
    ADD r12, r13           ; increment line count
tail_count_next:
    LDI r13, 1
    ADD r8, r13
    JMP tail_count_lines

tail_count_done:
    ; Compute start line: total_lines - N (but min 1)
    MOV r3, r12           ; total_lines
    SUB r3, r2           ; total - N
    LDI r13, 1
    CMP r3, r13
    BGE r6, tail_skip_ok
    MOV r3, r13            ; at least line 1

tail_skip_ok:
    ; Skip to start line
    LDI r8, 0x2000
    LDI r12, 1             ; current line

tail_skip_loop:
    CMP r12, r3
    BGE r6, tail_display   ; reached start line

tail_skip_next:
    LOAD r6, r8
    JZ r6, tail_done       ; end of file
    LDI r13, 10
    CMP r6, r13
    JNZ r6, tail_skip_adv
    LDI r13, 1
    ADD r12, r13            ; next line on newline
tail_skip_adv:
    LDI r13, 1
    ADD r8, r13
    JMP tail_skip_loop

tail_display:
    ; Display remaining lines
    LDI r3, 0x2400       ; line buffer
    LDI r1, 0            ; chars in line

tail_read_char:
    LOAD r6, r8
    JZ r6, tail_flush
    LDI r13, 10
    CMP r6, r13
    JZ r6, tail_flush

    STORE r3, r6
    LDI r13, 1
    ADD r8, r13
    ADD r3, r13
    ADD r1, r13
    LDI r13, 32
    CMP r1, r13
    BLT r6, tail_read_char
    JMP tail_flush

tail_flush:
    LDI r6, 0
    STORE r3, r6
    ; Display line
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, 0x2400
    TEXT r5, r13, r10

    ; Check if we consumed a newline
    LOAD r6, r8
    LDI r13, 10
    CMP r6, r13
    JZ r6, tail_skip_newline

tail_reset:
    LDI r3, 0x2400
    LDI r1, 0
    LOAD r6, r8
    JZ r6, tail_done
    JMP tail_read_char

tail_skip_newline:
    LDI r13, 1
    ADD r8, r13
    JMP tail_reset

tail_done:
    POP r8
    POP r3
    POP r1
    POP r12
    POP r2
    POP r9
    JMP exec_done

tail_err:
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, tail_usage_msg
    TEXT r5, r13, r10
    POP r8
    POP r3
    POP r1
    POP r12
    POP r2
    POP r9
    JMP exec_done

do_wc:
    ; wc <file> -- count lines, words, and bytes
    PUSH r9
    PUSH r2
    PUSH r12
    PUSH r1
    PUSH r3
    PUSH r8

    ; Check for argument
    LDI r15, 0x0600
    LOAD r6, r15
    JZ r6, wc_err

    ; Open file
    LDI r13, 0x0600
    LDI r5, 0
    OPEN r13, r5
    LDI r13, 0xFFFFFFFF
    CMP r6, r13
    JZ r6, wc_err

    MOV r7, r6
    LDI r10, 0x2000
    LDI r14, 400
    READ r7, r10, r14
    MOV r1, r6           ; save byte count
    CLOSE r7

    ; Null terminate
    LDI r11, 0x2000
    ADD r11, r6
    LDI r4, 0
    STORE r11, r4

    ; Count lines and words
    LDI r8, 0x2000       ; file pointer
    LDI r12, 0            ; line count
    LDI r2, 0            ; word count
    LDI r9, 0            ; prev was space (1=yes, 0=no)

wc_scan:
    LOAD r6, r8
    JZ r6, wc_format      ; end of file

    ; Count newlines
    LDI r13, 10
    CMP r6, r13
    JNZ r6, wc_not_nl
    LDI r13, 1
    ADD r12, r13           ; line++
    LDI r9, 1            ; prev = space
    JMP wc_next

wc_not_nl:
    ; Count words: space or other whitespace transitions
    LDI r13, 32            ; space
    CMP r6, r13
    JNZ r6, wc_not_space
    LDI r9, 1            ; prev = space
    JMP wc_next

wc_not_space:
    ; If prev was space and current is not, it is a new word
    LDI r13, 1
    CMP r9, r13
    JNZ r6, wc_next
    ADD r2, r13           ; word++
    LDI r9, 0            ; prev = not space

wc_next:
    LDI r13, 1
    ADD r8, r13
    JMP wc_scan

wc_format:
    ; Build output string at 0x2400: "N N N"
    ; Format: lines words bytes
    LDI r3, 0x2400

    ; Convert lines (r12) to decimal
    CALL wc_utoa
    ; Add space
    LDI r6, 32
    STORE r3, r6
    LDI r13, 1
    ADD r3, r13

    ; Convert words (r2) to decimal
    MOV r8, r2
    CALL wc_utoa
    ; Add space
    LDI r6, 32
    STORE r3, r6
    LDI r13, 1
    ADD r3, r13

    ; Convert bytes (r1) to decimal
    MOV r8, r1
    CALL wc_utoa
    ; Null terminate
    LDI r6, 0
    STORE r3, r6

    ; Display
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, 0x2400
    TEXT r5, r13, r10
    JMP wc_cleanup

wc_utoa:
    ; Convert r8 to decimal, write to buffer at r3
    ; Modifies r8, does not change r3 (caller manages it)
    PUSH r9
    ; Handle 0 case
    JNZ r8, wc_utoa_nonzero
    LDI r6, 48            ; '0'
    STORE r3, r6
    LDI r13, 1
    ADD r3, r13
    POP r9
    RET

wc_utoa_nonzero:
    ; Find number of digits by repeated division
    LDI r9, 0            ; digit count
    LDI r12, 10
    MOV r2, r8          ; temp copy

wc_count_digits:
    JZ r2, wc_do_digits
    LDI r13, 10
    DIV r2, r13
    LDI r13, 1
    ADD r9, r13
    JMP wc_count_digits

wc_do_digits:
    ; r9 = digit count. We need to write digits from most significant.
    ; Write digits to a temp area at 0x2500, then copy in order.
    LDI r12, 0x2500       ; temp digit buffer
    LDI r2, 0            ; digit index
    MOV r8, r2          ; restore original? No, r8 was modified.
    ; Actually we need to re-do the conversion. Let me use a simpler approach:
    ; Write digits in reverse order, then reverse them.
    ; Even simpler: since max bytes ~400, max 3 digits. Handle up to 999.
    POP r9
    PUSH r9
    PUSH r2
    PUSH r12
    PUSH r1

    ; Save r3 (output pointer)
    MOV r1, r3

    ; Write digits in reverse at 0x2500
    LDI r12, 0x2500
    LDI r2, 0            ; digit count

wc_div_loop:
    JZ r8, wc_rev_digits
    LDI r13, 10
    DIV r8, r13
    LDI r13, 48            ; '0'
    ADD r6, r13            ; r6 = digit char
    STORE r12, r6
    LDI r13, 1
    ADD r12, r13
    ADD r2, r13
    JMP wc_div_loop

wc_rev_digits:
    ; r2 = digit count at 0x2500 (reversed)
    ; Copy in reverse order to output
    JZ r2, wc_utoa_done
    LDI r13, 1
    SUB r2, r13
    LDI r12, 0x2500
    ADD r12, r2
    LOAD r6, r12
    STORE r1, r6
    LDI r13, 1
    ADD r1, r13
    JMP wc_rev_digits

wc_utoa_done:
    MOV r3, r1          ; update output pointer
    POP r1
    POP r12
    POP r2
    POP r9
    POP r9
    RET

wc_err:
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, wc_usage_msg
    TEXT r5, r13, r10
wc_cleanup:
    POP r8
    POP r3
    POP r1
    POP r12
    POP r2
    POP r9
    JMP exec_done

do_date:
    ; Display ticks since boot (proxy for uptime)
    PUSH r9
    PUSH r2
    PUSH r12
    PUSH r1

    ; Read TICKS from RAM[0xFFE]
    LDI r15, 0xFFE
    LOAD r8, r15           ; r8 = ticks

    ; Build output: "ticks: NNNN" at 0x2400
    LDI r3, 0x2400
    ; Write "ticks: "
    LDI r6, 116           ; t
    STORE r3, r6
    LDI r13, 1
    ADD r3, r13
    LDI r6, 105           ; i
    STORE r3, r6
    ADD r3, r13
    LDI r6, 99            ; c
    STORE r3, r6
    ADD r3, r13
    LDI r6, 107           ; k
    STORE r3, r6
    ADD r3, r13
    LDI r6, 115           ; s
    STORE r3, r6
    ADD r3, r13
    LDI r6, 58            ; :
    STORE r3, r6
    ADD r3, r13
    LDI r6, 32            ; space
    STORE r3, r6
    ADD r3, r13

    ; Convert ticks to decimal
    CALL date_utoa

    ; Null terminate
    LDI r6, 0
    STORE r3, r6

    ; Display
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r5, 4
    LDI r10, 0x2400
    TEXT r5, r13, r10

    POP r1
    POP r12
    POP r2
    POP r9
    JMP exec_done

date_utoa:
    ; Convert r8 to decimal, write to buffer at r3
    PUSH r9
    PUSH r2
    PUSH r12
    PUSH r1

    MOV r1, r3

    ; Handle 0
    JNZ r8, date_nonzero
    LDI r6, 48
    STORE r3, r6
    LDI r13, 1
    ADD r3, r13
    POP r1
    POP r12
    POP r2
    POP r9
    RET

date_nonzero:
    ; Write digits in reverse at 0x2600
    LDI r12, 0x2600
    LDI r2, 0

date_div:
    JZ r8, date_rev
    LDI r13, 10
    DIV r8, r13
    LDI r13, 48
    ADD r6, r13
    STORE r12, r6
    LDI r13, 1
    ADD r12, r13
    ADD r2, r13
    JMP date_div

date_rev:
    JZ r2, date_done
    LDI r13, 1
    SUB r2, r13
    LDI r12, 0x2600
    ADD r12, r2
    LOAD r6, r12
    STORE r1, r6
    LDI r13, 1
    ADD r1, r13
    JMP date_rev

date_done:
    MOV r3, r1
    POP r1
    POP r12
    POP r2
    POP r9
    RET

do_exec:
    ; Execute external program via EXEC
    ; Command name at 0x0400
    LDI r13, 0x0400
    EXEC r13               ; r6 = PID or error
    ; Check for error
    LDI r5, 0xFFFFFFFF
    CMP r6, r5
    JZ r6, exec_error

    ; Save PID
    LDI r15, 0x1202
    STORE r15, r6

    ; Wait for child to complete
exec_wait:
    LDI r13, 0x1202
    LOAD r13, r15
    WAITPID r13
    JZ r6, exec_wait     ; still running

    ; Check for pipe mode
    LDI r15, 0x1207
    LOAD r6, r15
    LDI r13, 1
    CMP r6, r13
    JZ r6, exec_pipe

    JMP exec_done

exec_pipe:
    ; Execute second command from pipe buffer
    LDI r13, 0x1400
    EXEC r13
    LDI r15, 0x1202
    STORE r15, r6
exec_pipe_wait:
    LDI r13, 0x1202
    LOAD r13, r15
    WAITPID r13
    JZ r6, exec_pipe_wait
    JMP exec_done

exec_error:
    ; Display "command not found"
    LDI r15, 0x1201
    LOAD r13, r15
    LDI r6, 12
    ADD r13, r6
    STORE r15, r13
    LDI r10, not_found_msg
    LDI r5, 4
    TEXT r5, r13, r10
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