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
    LDI r0, 0
    FILL r0               ; clear screen to black
    LDI r9, 0x1201
    LDI r0, 20
    STORE r9, r0          ; prompt y starts at line 20
    LDI r9, 0x1207
    LDI r0, 0
    STORE r9, r0          ; pipe mode = 0
    LDI r9, 0x1205
    STORE r9, r0          ; redirect mode = 0

    ; Write help text to buffer at 0x1300
    LDI r9, 0x1300
    LDI r0, 104       ; h
    STORE r9, r0
    LDI r9, 0x1301
    LDI r0, 101       ; e
    STORE r9, r0
    LDI r9, 0x1302
    LDI r0, 108       ; l
    STORE r9, r0
    LDI r9, 0x1303
    LDI r0, 112       ; p
    STORE r9, r0
    LDI r9, 0x1304
    LDI r0, 0
    STORE r9, r0

; ═══════════════════════════════════════════════════════════════
; Main loop: display prompt, read command, execute
; ═══════════════════════════════════════════════════════════════
main_loop:
    ; Display prompt "> " at current y position
    LDI r9, 0x1201         ; r9 = prompt y addr
    LOAD r1, r9            ; r1 = y position
    LDI r2, 2              ; x = 2
    LDI r3, prompt_str
    TEXT r2, r1, r3

    ; Read a line of input
    LDI r0, 0x0200         ; buf addr
    LDI r1, 200            ; max len
    LDI r2, 0x1200         ; pos addr
    LDI r9, 0x1200
    LDI r3, 0
    STORE r9, r3           ; reset position

readln_loop:
    READLN r0, r1, r2
    CMP r0, r3             ; r0 == 0 means still reading
    JZ r0, readln_loop

    ; r0 > 0 means line complete (Enter pressed)
    ; Check if line is empty
    JZ r0, main_loop       ; empty line, loop

    ; Parse and execute the command
    CALL parse_command
    CALL execute_command

    ; Scroll down prompt position
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1

    ; If y > 240, scroll screen and reset
    LDI r0, 240
    CMP r1, r0
    BLT r1, main_loop
    LDI r0, 10
    SCROLL r0
    LDI r1, 20
    STORE r9, r1
    JMP main_loop

; ═══════════════════════════════════════════════════════════════
; parse_command -- extract command name and argument from input
; Input: command buffer at 0x0200
; Output: command at 0x0400, argument at 0x0600
; Also sets pipe mode (0x1207) and redirect mode (0x1205)
; ═══════════════════════════════════════════════════════════════
parse_command:
    PUSH r15
    PUSH r14
    PUSH r13
    PUSH r12

    ; Reset pipe mode and redirect mode
    LDI r9, 0x1207
    LDI r0, 0
    STORE r9, r0
    LDI r9, 0x1205
    STORE r9, r0

    ; Skip leading spaces
    LDI r15, 0x0200       ; src pointer
skip_spaces:
    LOAD r0, r15
    JZ r0, parse_done      ; empty string
    LDI r1, 32
    CMP r0, r1
    JZ r0, skip_spaces     ; skip space

    ; Copy command name until space or null
    LDI r14, 0x0400       ; dest for command name
copy_cmd:
    LOAD r0, r15
    JZ r0, parse_cmd_done
    LDI r1, 32
    CMP r0, r1
    JZ r0, parse_cmd_done
    ; Check for pipe character '|' (124)
    LDI r1, 124
    CMP r0, r1
    JZ r0, parse_pipe_found
    ; Check for '>' (62)
    LDI r1, 62
    CMP r0, r1
    JZ r0, parse_redirect_out
    ; Check for '<' (60)
    LDI r1, 60
    CMP r0, r1
    JZ r0, parse_redirect_in
    STORE r14, r0
    ADD r15, r3            ; r3 is still 0 from earlier... let's use r1
    ; Actually need to increment properly
    LDI r1, 1
    ADD r15, r1
    LDI r1, 1
    ADD r14, r1
    JMP copy_cmd

parse_cmd_done:
    ; Null terminate command
    LDI r0, 0
    STORE r14, r0

    ; Skip spaces after command
    LOAD r0, r15
    JZ r0, parse_arg_done  ; no argument
skip_arg_spaces:
    LOAD r0, r15
    LDI r1, 32
    CMP r0, r1
    JZ r0, skip_arg_spaces_inc
    JMP copy_arg_start
skip_arg_spaces_inc:
    LDI r1, 1
    ADD r15, r1
    JMP skip_arg_spaces

copy_arg_start:
    ; Copy argument until null
    LDI r14, 0x0600       ; dest for argument
copy_arg:
    LOAD r0, r15
    JZ r0, parse_arg_done
    ; Check for pipe
    LDI r1, 124
    CMP r0, r1
    JZ r0, parse_pipe_found_arg
    ; Check for redirect
    LDI r1, 62
    CMP r0, r1
    JZ r0, parse_redirect_out_arg
    LDI r1, 60
    CMP r0, r1
    JZ r0, parse_redirect_in_arg
    STORE r14, r0
    LDI r1, 1
    ADD r15, r1
    ADD r14, r1
    JMP copy_arg

parse_arg_done:
    LDI r0, 0
    STORE r14, r0
    JMP parse_done

parse_pipe_found:
    ; Null terminate command
    LDI r0, 0
    STORE r14, r0
    ; Set pipe mode
    LDI r9, 0x1207
    LDI r0, 1
    STORE r9, r0
    ; Skip pipe char and spaces
    LDI r1, 1
    ADD r15, r1
skip_pipe_spaces:
    LOAD r0, r15
    LDI r1, 32
    CMP r0, r1
    JZ r0, skip_pipe_spaces_inc
    JMP copy_pipe_cmd
skip_pipe_spaces_inc:
    LDI r1, 1
    ADD r15, r1
    JMP skip_pipe_spaces

copy_pipe_cmd:
    ; Copy second command to pipe buffer at 0x1400
    LDI r14, 0x1400
copy_pipe_loop:
    LOAD r0, r15
    JZ r0, parse_pipe_done
    STORE r14, r0
    LDI r1, 1
    ADD r15, r1
    ADD r14, r1
    JMP copy_pipe_loop
parse_pipe_done:
    LDI r0, 0
    STORE r14, r0
    JMP parse_done

parse_pipe_found_arg:
    ; Null terminate argument
    LDI r0, 0
    STORE r14, r0
    ; Set pipe mode
    LDI r9, 0x1207
    LDI r0, 1
    STORE r9, r0
    ; Skip pipe char and spaces
    LDI r1, 1
    ADD r15, r1
skip_pipe_spaces2:
    LOAD r0, r15
    LDI r1, 32
    CMP r0, r1
    JZ r0, skip_pipe_spaces2_inc
    JMP copy_pipe_cmd2
skip_pipe_spaces2_inc:
    LDI r1, 1
    ADD r15, r1
    JMP skip_pipe_spaces2

copy_pipe_cmd2:
    LDI r14, 0x1400
copy_pipe_loop2:
    LOAD r0, r15
    JZ r0, parse_done2
    STORE r14, r0
    LDI r1, 1
    ADD r15, r1
    ADD r14, r1
    JMP copy_pipe_loop2
parse_done2:
    LDI r0, 0
    STORE r14, r0
    JMP parse_done

parse_redirect_out:
    ; Null terminate command
    LDI r0, 0
    STORE r14, r0
    ; Check for >> (append)
    LDI r1, 1
    ADD r15, r1
    LOAD r0, r15
    LDI r1, 62
    CMP r0, r1
    JZ r0, redirect_append
    ; Single > = write (mode 1)
    LDI r9, 0x1205
    LDI r0, 1
    STORE r9, r0
    JMP skip_redir_spaces
redirect_append:
    LDI r9, 0x1205
    LDI r0, 2
    STORE r9, r0
    LDI r1, 1
    ADD r15, r1
    JMP skip_redir_spaces

parse_redirect_out_arg:
    ; Null terminate argument
    LDI r0, 0
    STORE r14, r0
    LDI r1, 1
    ADD r15, r1
    LOAD r0, r15
    LDI r1, 62
    CMP r0, r1
    JZ r0, redirect_append2
    LDI r9, 0x1205
    LDI r0, 1
    STORE r9, r0
    JMP skip_redir_spaces
redirect_append2:
    LDI r9, 0x1205
    LDI r0, 2
    STORE r9, r0
    LDI r1, 1
    ADD r15, r1
    JMP skip_redir_spaces

parse_redirect_in:
    LDI r0, 0
    STORE r14, r0
    LDI r9, 0x1205
    LDI r0, 3
    STORE r9, r0
    LDI r1, 1
    ADD r15, r1
    JMP skip_redir_spaces

parse_redirect_in_arg:
    LDI r0, 0
    STORE r14, r0
    LDI r9, 0x1205
    LDI r0, 3
    STORE r9, r0
    LDI r1, 1
    ADD r15, r1
    JMP skip_redir_spaces

skip_redir_spaces:
    LOAD r0, r15
    LDI r1, 32
    CMP r0, r1
    JZ r0, skip_redir_spaces_inc
    JMP copy_redir_file
skip_redir_spaces_inc:
    LDI r1, 1
    ADD r15, r1
    JMP skip_redir_spaces

copy_redir_file:
    ; Copy redirect filename to argument buffer (0x0600)
    LDI r14, 0x0600
copy_redir_loop:
    LOAD r0, r15
    JZ r0, parse_done
    STORE r14, r0
    LDI r1, 1
    ADD r15, r1
    ADD r14, r1
    JMP copy_redir_loop

parse_done:
    POP r12
    POP r13
    POP r14
    POP r15
    RET

; ═══════════════════════════════════════════════════════════════
; execute_command -- dispatch to built-in or EXEC
; Command at 0x0400, argument at 0x0600
; ═══════════════════════════════════════════════════════════════
execute_command:
    PUSH r15
    PUSH r14
    PUSH r13

    ; Check for empty command
    LDI r9, 0x0400
    LOAD r0, r9
    JZ r0, exec_done

    ; Compare command with known built-ins
    ; help
    CALL cmd_is_help
    JNZ r0, do_help

    ; echo
    CALL cmd_is_echo
    JNZ r0, do_echo

    ; ls
    CALL cmd_is_ls
    JNZ r0, do_ls

    ; cat
    CALL cmd_is_cat
    JNZ r0, do_cat

    ; ps
    CALL cmd_is_ps
    JNZ r0, do_ps

    ; kill
    CALL cmd_is_kill
    JNZ r0, do_kill

    ; export
    CALL cmd_is_export
    JNZ r0, do_export

    ; clear
    CALL cmd_is_clear
    JNZ r0, do_clear

    ; rm
    CALL cmd_is_rm
    JNZ r0, do_rm

    ; cp
    CALL cmd_is_cp
    JNZ r0, do_cp

    ; hypervisor
    CALL cmd_is_hypervisor
    JNZ r0, do_hypervisor

    ; edit
    CALL cmd_is_edit
    JNZ r0, do_edit

    ; save
    CALL cmd_is_save
    JNZ r0, do_save

    ; grep
    CALL cmd_is_grep
    JNZ r0, do_grep

    ; head
    CALL cmd_is_head
    JNZ r0, do_head

    ; tail
    CALL cmd_is_tail
    JNZ r0, do_tail

    ; wc
    CALL cmd_is_wc
    JNZ r0, do_wc

    ; date
    CALL cmd_is_date
    JNZ r0, do_date

    ; Not a built-in -- try EXEC
    JMP do_exec

exec_done:
    POP r13
    POP r14
    POP r15
    RET

; ── Command comparison helpers ────────────────────────────────
; Each sets r0=1 if match, r0=0 if not

cmd_is_help:
    LDI r9, 0x0400
    LDI r0, 104       ; h
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cmd_help_n
    LDI r9, 0x0401
    LDI r0, 101       ; e
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cmd_help_n
    LDI r9, 0x0402
    LDI r0, 108       ; l
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cmd_help_n
    LDI r9, 0x0403
    LDI r0, 112       ; p
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cmd_help_n
    LDI r9, 0x0404
    LDI r0, 0
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cmd_help_n
    LDI r0, 1
    RET
cmd_help_n:
    LDI r0, 0
    RET

cmd_is_echo:
    LDI r9, 0x0400
    LDI r0, 101       ; e
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0401
    LDI r0, 99        ; c
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0402
    LDI r0, 104       ; h
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0403
    LDI r0, 111       ; o
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0404
    LDI r0, 0
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_ls:
    LDI r9, 0x0400
    LDI r0, 108       ; l
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0401
    LDI r0, 115       ; s
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0402
    LDI r0, 0
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_cat:
    LDI r9, 0x0400
    LDI r0, 99        ; c
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0401
    LDI r0, 97        ; a
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0402
    LDI r0, 116       ; t
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0403
    LDI r0, 0
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_ps:
    LDI r9, 0x0400
    LDI r0, 112       ; p
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0401
    LDI r0, 115       ; s
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0402
    LDI r0, 0
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_kill:
    LDI r9, 0x0400
    LDI r0, 107       ; k
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0401
    LDI r0, 105       ; i
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0402
    LDI r0, 108       ; l
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0403
    LDI r0, 108       ; l
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0404
    LDI r0, 0
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_export:
    LDI r9, 0x0400
    LDI r0, 101       ; e
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0401
    LDI r0, 120       ; x
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0402
    LDI r0, 112       ; p
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0403
    LDI r0, 111       ; o
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0404
    LDI r0, 114       ; r
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0405
    LDI r0, 116       ; t
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0406
    LDI r0, 0
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_clear:
    LDI r9, 0x0400
    LDI r0, 99        ; c
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0401
    LDI r0, 108       ; l
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0402
    LDI r0, 101       ; e
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0403
    LDI r0, 97        ; a
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0404
    LDI r0, 114       ; r
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0405
    LDI r0, 0
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_rm:
    LDI r9, 0x0400
    LDI r0, 114       ; r
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0401
    LDI r0, 109       ; m
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0402
    LDI r0, 0
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_cp:
    LDI r9, 0x0400
    LDI r0, 99        ; c
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0401
    LDI r0, 112       ; p
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0402
    LDI r0, 0
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_hypervisor:
    LDI r9, 0x0400
    LDI r0, 104       ; h
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0401
    LDI r0, 121       ; y
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0402
    LDI r0, 112       ; p
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0403
    LDI r0, 101       ; e
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0404
    LDI r0, 114       ; r
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0405
    LDI r0, 118       ; v
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0406
    LDI r0, 105       ; i
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0407
    LDI r0, 115       ; s
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0408
    LDI r0, 111       ; o
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0409
    LDI r0, 114       ; r
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x040A
    LDI r0, 0
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_edit:
    LDI r9, 0x0400
    LDI r0, 101       ; e
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0401
    LDI r0, 100       ; d
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0402
    LDI r0, 105       ; i
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0403
    LDI r0, 116       ; t
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0404
    LDI r0, 0
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_save:
    LDI r9, 0x0400
    LDI r0, 115       ; s
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0401
    LDI r0, 97        ; a
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0402
    LDI r0, 118       ; v
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0403
    LDI r0, 101       ; e
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0404
    LDI r0, 0
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_grep:
    LDI r9, 0x0400
    LDI r0, 103       ; g
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0401
    LDI r0, 114       ; r
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0402
    LDI r0, 101       ; e
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0403
    LDI r0, 112       ; p
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0404
    LDI r0, 0
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_head:
    LDI r9, 0x0400
    LDI r0, 104       ; h
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0401
    LDI r0, 101       ; e
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0402
    LDI r0, 97        ; a
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0403
    LDI r0, 100       ; d
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0404
    LDI r0, 0
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_tail:
    LDI r9, 0x0400
    LDI r0, 116       ; t
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0401
    LDI r0, 97        ; a
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0402
    LDI r0, 105       ; i
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0403
    LDI r0, 108       ; l
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0404
    LDI r0, 0
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_wc:
    LDI r9, 0x0400
    LDI r0, 119       ; w
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0401
    LDI r0, 99        ; c
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0402
    LDI r0, 0
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_date:
    LDI r9, 0x0400
    LDI r0, 100       ; d
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0401
    LDI r0, 97        ; a
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0402
    LDI r0, 116       ; t
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0403
    LDI r0, 101       ; e
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r9, 0x0404
    LDI r0, 0
    LOAD r1, r9
    CMP r0, r1
    JNZ r0, cno
    LDI r0, 1
    RET

cno:
    LDI r0, 0
    RET

; ── Built-in command implementations ──────────────────────────

do_help:
    ; Display available commands
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r2, 2
    LDI r3, help_text
    TEXT r2, r1, r3
    JMP exec_done

do_echo:
    ; Print the argument
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, 0x0600
    TEXT r2, r1, r3
    JMP exec_done

do_ls:
    ; List files using LS opcode
    LDI r1, 0x0800
    LS r1                  ; list files into buffer at 0x0800
    ; r0 = number of files
    ; Display each filename
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, 0x0800
    TEXT r2, r1, r3
    JMP exec_done

do_cat:
    ; Read and display a file
    ; Argument (filename) at 0x0600
    LDI r1, 0x0600       ; filename addr
    LDI r2, 0            ; mode = read
    OPEN r1, r2           ; r0 = fd
    ; Check for error
    LDI r1, 0xFFFFFFFF
    CMP r0, r1
    JZ r0, exec_done      ; error, skip

    MOV r5, r0            ; save fd in r5
    LDI r3, 0x1000        ; read buffer
    LDI r4, 200           ; max bytes
    READ r5, r3, r4       ; r0 = bytes read
    ; Null terminate
    LDI r6, 200
    CMP r0, r6
    BLT r0, cat_term_ok
    LDI r0, 200
cat_term_ok:
    LDI r6, 0x1000
    ADD r0, r6
    LDI r7, 0
    STORE r0, r7
    ; Display
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, 0x1000
    TEXT r2, r1, r3
    CLOSE r5
    JMP exec_done

do_ps:
    ; Display process info
    ; For now, show PID count and current PID
    GETPID
    MOV r5, r0            ; save our PID
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    ; Show "PID: N" using register value
    ; Write PID as text at 0x1500
    LDI r9, 0x1500
    LDI r0, 80            ; P
    STORE r9, r0
    LDI r9, 0x1501
    LDI r0, 73            ; I
    STORE r9, r0
    LDI r9, 0x1502
    LDI r0, 68            ; D
    STORE r9, r0
    LDI r9, 0x1503
    LDI r0, 58            ; :
    STORE r9, r0
    LDI r9, 0x1504
    LDI r0, 32            ; space
    STORE r9, r0
    ; Convert PID to decimal digits
    LDI r9, 0x1505
    LDI r1, 48            ; '0'
    ADD r0, r1
    STORE r9, r0
    LDI r9, 0x1506
    LDI r0, 0
    STORE r9, r0
    LDI r2, 4
    LDI r3, 0x1500
    TEXT r2, r1, r3
    JMP exec_done

do_kill:
    ; Kill a process by PID
    ; Argument should be a number -- simplified: just echo "kill"
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r3, kill_msg
    LDI r2, 4
    TEXT r2, r1, r3
    JMP exec_done

do_export:
    ; Set environment variable
    ; Argument format: KEY=VALUE
    ; For simplicity, just acknowledge
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r3, export_msg
    LDI r2, 4
    TEXT r2, r1, r3
    JMP exec_done

do_clear:
    LDI r0, 0
    FILL r0
    LDI r9, 0x1201
    LDI r0, 20
    STORE r9, r0
    JMP exec_done

do_rm:
    ; Delete a file: rm <filename>
    ; Argument (filename) at 0x0600
    LDI r9, 0x0600
    LOAD r0, r9
    JZ r0, rm_usage
    ; Copy arg to a clean buffer at 0x1600
    LDI r13, 0x0600
    LDI r14, 0x1600
rm_copy:
    LOAD r0, r13
    JZ r0, rm_copy_done
    STORE r14, r0
    LDI r0, 1
    ADD r13, r0
    ADD r14, r0
    JMP rm_copy
rm_copy_done:
    LDI r0, 0
    STORE r14, r0      ; null terminate
    ; UNLINK r1 where r1 = 0x1600
    LDI r1, 0x1600
    UNLINK r1
    ; r0 = 0 on success, 0xFFFFFFFF on error
    LDI r1, 0xFFFFFFFF
    CMP r0, r1
    JNZ r0, rm_ok
    ; Print error
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r2, 8          ; "rm: error"
    LDI r3, 0x1700
    ; Store "rm: error" message
    LDI r9, 0x1700
    LDI r0, 114        ; r
    STORE r9, r0
    LDI r9, 0x1701
    LDI r0, 109        ; m
    STORE r9, r0
    LDI r9, 0x1702
    LDI r0, 58         ; :
    STORE r9, r0
    LDI r9, 0x1703
    LDI r0, 32         ; space
    STORE r9, r0
    LDI r9, 0x1704
    LDI r0, 101        ; e
    STORE r9, r0
    LDI r9, 0x1705
    LDI r0, 114        ; r
    STORE r9, r0
    LDI r9, 0x1706
    LDI r0, 114        ; r
    STORE r9, r0
    LDI r9, 0x1707
    LDI r0, 111        ; o
    STORE r9, r0
    LDI r9, 0x1708
    LDI r0, 114        ; r
    STORE r9, r0
    LDI r9, 0x1709
    LDI r0, 0
    STORE r9, r0
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r2, 9
    LDI r3, 0x1700
    TEXT r2, r1, r3
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    JMP exec_done
rm_ok:
    JMP exec_done
rm_usage:
    ; Print "rm <file>"
    LDI r9, 0x1700
    LDI r0, 114        ; r
    STORE r9, r0
    LDI r9, 0x1701
    LDI r0, 109        ; m
    STORE r9, r0
    LDI r9, 0x1702
    LDI r0, 32         ; space
    STORE r9, r0
    LDI r9, 0x1703
    LDI r0, 60         ; <
    STORE r9, r0
    LDI r9, 0x1704
    LDI r0, 102        ; f
    STORE r9, r0
    LDI r9, 0x1705
    LDI r0, 105        ; i
    STORE r9, r0
    LDI r9, 0x1706
    LDI r0, 108        ; l
    STORE r9, r0
    LDI r9, 0x1707
    LDI r0, 101        ; e
    STORE r9, r0
    LDI r9, 0x1708
    LDI r0, 62         ; >
    STORE r9, r0
    LDI r9, 0x1709
    LDI r0, 0
    STORE r9, r0
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r2, 9
    LDI r3, 0x1700
    TEXT r2, r1, r3
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    JMP exec_done

do_cp:
    ; Copy a file: cp <src> <dst>
    ; Arguments at 0x0600, separated by space
    ; Parse second argument from 0x0600 into 0x1800
    LDI r9, 0x0600
    LOAD r0, r9
    JZ r0, cp_usage
    ; Find space separator
    LDI r13, 0x0600
cp_find_space:
    LOAD r0, r13
    JZ r0, cp_usage    ; no space found -- need 2 args
    LDI r1, 32         ; space
    CMP r0, r1
    JZ r0, cp_found_space
    LDI r0, 1
    ADD r13, r0
    JMP cp_find_space
cp_found_space:
    ; Skip the space, copy rest to 0x1800
    LDI r0, 1
    ADD r13, r0
    LDI r14, 0x1800
cp_copy_dst:
    LOAD r0, r13
    JZ r0, cp_copy_dst_done
    STORE r14, r0
    LDI r0, 1
    ADD r13, r0
    ADD r14, r0
    JMP cp_copy_dst
cp_copy_dst_done:
    LDI r0, 0
    STORE r14, r0
    ; Null-terminate the source filename (replace space with 0)
    LDI r13, 0x0600
    LDI r14, 0x1600
cp_copy_src:
    LOAD r0, r13
    JZ r0, cp_src_done
    LDI r1, 32
    CMP r0, r1
    JZ r0, cp_src_terminate
    STORE r14, r0
    LDI r0, 1
    ADD r13, r0
    ADD r14, r0
    JMP cp_copy_src
cp_src_terminate:
    LDI r0, 0
    STORE r14, r0
    JMP cp_do_copy
cp_src_done:
    STORE r14, r0
cp_do_copy:
    ; FCOPY r1, r2 where r1=0x1600 (src), r2=0x1800 (dst)
    LDI r1, 0x1600
    LDI r2, 0x1800
    FCOPY r1, r2
    ; Check result
    LDI r1, 0xFFFFFFFF
    CMP r0, r1
    JNZ r0, cp_ok
    ; Print error
    LDI r9, 0x1700
    LDI r0, 99         ; c
    STORE r9, r0
    LDI r9, 0x1701
    LDI r0, 112        ; p
    STORE r9, r0
    LDI r9, 0x1702
    LDI r0, 58         ; :
    STORE r9, r0
    LDI r9, 0x1703
    LDI r0, 32         ; space
    STORE r9, r0
    LDI r9, 0x1704
    LDI r0, 101        ; e
    STORE r9, r0
    LDI r9, 0x1705
    LDI r0, 114        ; r
    STORE r9, r0
    LDI r9, 0x1706
    LDI r0, 114        ; r
    STORE r9, r0
    LDI r9, 0x1707
    LDI r0, 111        ; o
    STORE r9, r0
    LDI r9, 0x1708
    LDI r0, 114        ; r
    STORE r9, r0
    LDI r9, 0x1709
    LDI r0, 0
    STORE r9, r0
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r2, 9
    LDI r3, 0x1700
    TEXT r2, r1, r3
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    JMP exec_done
cp_ok:
    JMP exec_done
cp_usage:
    LDI r9, 0x1700
    LDI r0, 99         ; c
    STORE r9, r0
    LDI r9, 0x1701
    LDI r0, 112        ; p
    STORE r9, r0
    LDI r9, 0x1702
    LDI r0, 32         ; space
    STORE r9, r0
    LDI r9, 0x1703
    LDI r0, 60         ; <
    STORE r9, r0
    LDI r9, 0x1704
    LDI r0, 115        ; s
    STORE r9, r0
    LDI r9, 0x1705
    LDI r0, 114        ; r
    STORE r9, r0
    LDI r9, 0x1706
    LDI r0, 99        ; c
    STORE r9, r0
    LDI r9, 0x1707
    LDI r0, 62         ; >
    STORE r9, r0
    LDI r9, 0x1708
    LDI r0, 32         ; space
    STORE r9, r0
    LDI r9, 0x1709
    LDI r0, 60         ; <
    STORE r9, r0
    LDI r9, 0x170A
    LDI r0, 100        ; d
    STORE r9, r0
    LDI r9, 0x170B
    LDI r0, 115        ; s
    STORE r9, r0
    LDI r9, 0x170C
    LDI r0, 116        ; t
    STORE r9, r0
    LDI r9, 0x170D
    LDI r0, 62         ; >
    STORE r9, r0
    LDI r9, 0x170E
    LDI r0, 0
    STORE r9, r0
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r2, 14
    LDI r3, 0x1700
    TEXT r2, r1, r3
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    JMP exec_done

do_hypervisor:
    PUSH r14
    PUSH r13
    ; Check if argument exists
    LDI r9, 0x0600
    LOAD r0, r9
    JZ r0, hypervisor_usage

    ; Copy argument (0x0600) to config buffer (0x1B00)
    LDI r13, 0x0600       ; src
    LDI r14, 0x1B00       ; dst
hypervisor_copy:
    LOAD r0, r13
    JZ r0, hypervisor_copy_done
    STORE r14, r0
    LDI r0, 1
    ADD r13, r0
    ADD r14, r0
    JMP hypervisor_copy
hypervisor_copy_done:
    LDI r0, 0
    STORE r14, r0         ; null terminate

    ; Call HYPERVISOR with config buffer address
    LDI r0, 0x1B00
    HYPERVISOR r0

    ; Check result: 0 = success, 0xFFFFFFFF = error, 0xFFFFFFFD = missing arch
    JZ r0, hypervisor_ok
    LDI r1, 0xFFFFFFFF
    CMP r0, r1
    JZ r0, hypervisor_err
    ; Missing arch or other error
    JMP hypervisor_err

hypervisor_ok:
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    ; Display "hypervisor started" message
    LDI r2, 4
    LDI r3, hypervisor_ok_msg
    TEXT r2, r1, r3
    JMP hypervisor_done

hypervisor_usage:
    ; No argument -- show usage
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, hypervisor_usage_msg
    TEXT r2, r1, r3
    JMP hypervisor_done

hypervisor_err:
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, hypervisor_err_msg
    TEXT r2, r1, r3
    JMP hypervisor_done

hypervisor_done:
    POP r13
    POP r14
    JMP exec_done

do_edit:
    PUSH r15
    PUSH r14
    PUSH r13
    PUSH r12

    ; Check for argument
    LDI r9, 0x0600
    LOAD r0, r9
    JZ r0, edit_usage

    ; Open file for reading
    LDI r1, 0x0600       ; filename addr
    LDI r2, 0            ; mode = read
    OPEN r1, r2           ; r0 = fd
    ; Check for error
    LDI r1, 0xFFFFFFFF
    CMP r0, r1
    JZ r0, edit_err      ; file not found

    MOV r5, r0            ; save fd in r5

    ; Read file content into buffer at 0x2000
    LDI r3, 0x2000        ; read buffer (8KB, up to row 127 * 32 cols)
    LDI r4, 4096          ; max words to read
    READ r5, r3, r4       ; r0 = bytes read

    ; Close the file
    CLOSE r5

    ; Null terminate at position bytes_read
    LDI r6, 0x2000
    ADD r6, r0            ; r6 = buffer + bytes_read
    LDI r7, 0
    STORE r6, r7          ; null terminator

    ; Display file content on screen, line by line
    ; Each line is up to 32 chars, separated by newline (10) or null
    LDI r10, 0x2000       ; source pointer
    LDI r11, 4            ; y position (start near top)
    LDI r12, 0            ; line buffer index

edit_line_loop:
    LOAD r0, r10
    JZ r0, edit_done      ; null = end of file

    ; Check for newline (10)
    LDI r1, 10
    CMP r0, r1
    JZ r0, edit_newline

    ; Store char in line buffer at 0x2100 + index
    LDI r13, 0x2100
    ADD r13, r12
    STORE r13, r0

    LDI r1, 1
    ADD r10, r1           ; advance source
    ADD r12, r1           ; advance line index

    ; Check if line is 32 chars (screen width at 8px font)
    LDI r1, 32
    CMP r12, r1
    JZ r0, edit_line_full
    JMP edit_line_loop

edit_newline:
    ; Null-terminate current line
    LDI r13, 0x2100
    ADD r13, r12
    LDI r0, 0
    STORE r13, r0

    ; Display line at y position
    LDI r2, 4             ; x = 4
    LDI r3, 0x2100        ; line buffer
    TEXT r2, r11, r3      ; render text at (4, y)

    ; Advance to next line
    LDI r1, 1
    ADD r10, r1           ; skip the newline char
    ADD r11, r1           ; next y position
    LDI r12, 0            ; reset line buffer index
    JMP edit_line_loop

edit_line_full:
    ; Null-terminate
    LDI r13, 0x2100
    ADD r13, r12
    LDI r0, 0
    STORE r13, r0

    ; Display line
    LDI r2, 4
    LDI r3, 0x2100
    TEXT r2, r11, r3

    ; Next line (no source advance since char was already stored)
    LDI r1, 1
    ADD r10, r1
    ADD r11, r1
    LDI r12, 0
    JMP edit_line_loop

edit_done:
    ; Null-terminate last line if there's content
    JZ r12, edit_show_msg
    LDI r13, 0x2100
    ADD r13, r12
    LDI r0, 0
    STORE r13, r0
    LDI r2, 4
    LDI r3, 0x2100
    TEXT r2, r11, r3

edit_show_msg:
    ; Show "[edit: filename]" at bottom
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, edit_ok_msg
    TEXT r2, r1, r3
    JMP edit_cleanup

edit_usage:
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, edit_usage_msg
    TEXT r2, r1, r3
    JMP edit_cleanup

edit_err:
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, edit_err_msg
    TEXT r2, r1, r3

edit_cleanup:
    POP r12
    POP r13
    POP r14
    POP r15
    JMP exec_done

do_save:
    PUSH r15
    PUSH r14
    PUSH r13
    PUSH r12

    ; Check for argument
    LDI r9, 0x0600
    LOAD r0, r9
    JZ r0, save_usage

    ; Open file for writing (mode 1 = write/create)
    LDI r1, 0x0600       ; filename addr
    LDI r2, 1            ; mode = write
    OPEN r1, r2           ; r0 = fd
    ; Check for error
    LDI r1, 0xFFFFFFFF
    CMP r0, r1
    JZ r0, save_err      ; could not create file

    MOV r5, r0            ; save fd in r5

    ; Calculate content length from edit buffer at 0x2000
    ; Scan for null terminator
    LDI r10, 0x2000
    LDI r11, 0            ; length counter
save_scan:
    LOAD r0, r10
    JZ r0, save_scan_done
    LDI r1, 1
    ADD r10, r1
    ADD r11, r1
    JMP save_scan

save_scan_done:
    ; If nothing to save, show message
    JZ r11, save_empty

    ; Write content to file
    LDI r1, 0x2000        ; buffer addr
    MOV r2, r1             ; fd_reg = r5 already
    ; WRITE fd_reg, buf_reg, len_reg
    MOV r1, r5             ; r1 = fd
    LDI r2, 0x2000         ; buf addr
    MOV r3, r11            ; length
    WRITE r1, r2, r3       ; r0 = bytes written

    CLOSE r5               ; close file

    ; Show "[saved: N bytes]" message
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, save_ok_msg
    TEXT r2, r1, r3
    JMP save_cleanup

save_empty:
    CLOSE r5
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, save_empty_msg
    TEXT r2, r1, r3
    JMP save_cleanup

save_usage:
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, save_usage_msg
    TEXT r2, r1, r3
    JMP save_cleanup

save_err:
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, save_err_msg
    TEXT r2, r1, r3

save_cleanup:
    POP r12
    POP r13
    POP r14
    POP r15
    JMP exec_done

do_grep:
    ; grep <pattern> <file> -- search file for lines containing pattern
    ; Argument at 0x0600 is "pattern file"
    ; We need to split: first word = pattern, second word = filename
    PUSH r15
    PUSH r14
    PUSH r13
    PUSH r12
    PUSH r11
    PUSH r10

    ; Parse argument: find first space to split pattern from filename
    ; Store pattern at 0x2200, filename at 0x2300
    LDI r10, 0x0600      ; arg pointer
    LDI r11, 0x2200      ; pattern buffer
    LDI r12, 0           ; pattern length

grep_parse_pat:
    LOAD r0, r10
    JZ r0, grep_no_file   ; no space found, error
    LDI r1, 32            ; space
    CMP r0, r1
    JZ r0, grep_copy_file
    STORE r11, r0
    LDI r1, 1
    ADD r10, r1
    ADD r11, r1
    ADD r12, r1
    JMP grep_parse_pat

grep_copy_file:
    ; Skip the space
    LDI r1, 1
    ADD r10, r1
    ; Copy filename to 0x2300
    LDI r11, 0x2300

grep_copy_file_loop:
    LOAD r0, r10
    JZ r0, grep_have_file
    STORE r11, r0
    LDI r1, 1
    ADD r10, r1
    ADD r11, r1
    JMP grep_copy_file_loop

grep_have_file:
    LDI r0, 0
    STORE r11, r0         ; null terminate filename
    ; Null terminate pattern
    LDI r11, 0x2200
    ADD r11, r12
    STORE r11, r0

    ; Check pattern length > 0
    JZ r12, grep_err

    ; Open file
    LDI r1, 0x2300       ; filename addr
    LDI r2, 0            ; mode = read
    OPEN r1, r2           ; r0 = fd
    LDI r1, 0xFFFFFFFF
    CMP r0, r1
    JZ r0, grep_err

    MOV r5, r0            ; save fd

    ; Read file content into 0x2000
    LDI r3, 0x2000
    LDI r4, 400           ; max bytes to read
    READ r5, r3, r4
    CLOSE r5

    ; Null terminate at read position
    LDI r6, 0x2000
    ADD r6, r0
    LDI r7, 0
    STORE r6, r7

    ; Scan file line by line, check if each line contains the pattern
    ; Line buffer at 0x2400, max 64 chars
    ; Save file pointer at 0x2380 (pattern_len * 4 + pattern_buf end)
    ; Actually, save at 0x23FF (safe scratch)
    LDI r10, 0x2000       ; file pointer
    LDI r13, 0            ; match count

grep_line_loop:
    ; Save file pointer to scratch
    MOV r8, r10           ; r8 = saved file ptr

    LOAD r0, r10
    JZ r0, grep_done       ; end of file

    ; Copy line to buffer at 0x2400, track length
    LDI r11, 0x2400
    LDI r12, 0            ; line length

grep_copy_line:
    LOAD r0, r10
    JZ r0, grep_check_line     ; end of file, check this line
    LDI r1, 10                 ; newline
    CMP r0, r1
    JZ r0, grep_advance_nl
    STORE r11, r0
    LDI r1, 1
    ADD r10, r1
    ADD r11, r1
    ADD r12, r1
    LDI r1, 64
    CMP r12, r1
    JZ r0, grep_check_line
    JMP grep_copy_line

grep_advance_nl:
    LDI r1, 1
    ADD r10, r1             ; skip newline

grep_check_line:
    ; Null terminate line buffer
    LDI r0, 0
    STORE r11, r0

    ; Compute pattern length (scan 0x2200 for null)
    LDI r14, 0
    LDI r15, 0x2200

grep_scan_pat_len:
    LOAD r0, r15
    JZ r0, grep_have_pat_len
    LDI r1, 1
    ADD r15, r1
    ADD r14, r1
    JMP grep_scan_pat_len

grep_have_pat_len:
    ; r14 = pattern length, r12 = line length
    ; Skip if line shorter than pattern
    CMP r12, r14
    BLT r0, grep_next_line

    ; Simple substring search: check each starting position
    ; r12 - r14 = max starting position
    SUB r12, r14           ; r12 = max_start (line_len - pat_len)

grep_search_pos:
    ; r11 = current position in line (0x2400 + offset)
    ; Use offset tracking instead of absolute address comparison
    LDI r9, 0              ; search offset

grep_search_pos2:
    CMP r9, r12            ; offset vs max_start
    BGE r0, grep_next_line

    ; Compare pattern with line at offset r9
    LDI r15, 0x2400
    ADD r15, r9            ; r15 = line_base + offset
    LDI r13, 0x2200        ; pattern start
    LDI r1, 0              ; chars matched

grep_cmp_loop:
    LOAD r0, r15
    LOAD r2, r13
    CMP r0, r2
    JNZ r0, grep_no_match_here
    ; Match so far
    LDI r3, 1
    ADD r15, r3
    ADD r13, r3
    ADD r1, r3             ; count matched chars
    CMP r1, r14            ; matched vs pattern_len
    BLT r0, grep_cmp_loop
    JMP grep_found_match

grep_no_match_here:
    LDI r3, 1
    ADD r9, r3             ; advance offset
    JMP grep_search_pos2

grep_found_match:
    ; Display the matching line
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, 0x2400
    TEXT r2, r1, r3

grep_next_line:
    ; Restore file pointer from r8
    MOV r10, r8
    JMP grep_line_loop

grep_no_file:
    ; Missing filename argument
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, grep_usage
    TEXT r2, r1, r3
    JMP grep_cleanup

grep_err:
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, grep_err_msg
    TEXT r2, r1, r3
    JMP grep_cleanup

grep_done:
    POP r10
    POP r11
    POP r12
    POP r13
    POP r14
    POP r15
    JMP exec_done

grep_cleanup:
    POP r10
    POP r11
    POP r12
    POP r13
    POP r14
    POP r15
    JMP exec_done

do_head:
    ; head <file> [N] -- display first N lines (default 10)
    ; Argument at 0x0600 is "file N"
    PUSH r15
    PUSH r14
    PUSH r13
    PUSH r12
    PUSH r11
    PUSH r10

    ; Parse: filename at 0x0600, optional number after space
    ; Copy filename to 0x2200, check for trailing number
    LDI r10, 0x0600
    LDI r11, 0x2200

head_copy_name:
    LOAD r0, r10
    JZ r0, head_name_done
    LDI r1, 32
    CMP r0, r1
    JZ r0, head_parse_n
    STORE r11, r0
    LDI r1, 1
    ADD r10, r1
    ADD r11, r1
    JMP head_copy_name

head_parse_n:
    ; Skip space
    LDI r1, 1
    ADD r10, r1
    ; Parse number (single digit 1-9 for simplicity)
    LDI r14, 10           ; default N = 10
    LOAD r0, r10
    JZ r0, head_name_done  ; no number, use default
    ; Subtract '0' (48) to get digit
    LDI r1, 48
    SUB r0, r1
    ; If result is 1-9, use it; else default 10
    LDI r1, 1
    CMP r0, r1
    BLT r0, head_name_done
    LDI r1, 9
    CMP r0, r1
    BGE r0, head_name_done
    MOV r14, r0           ; use parsed N

head_name_done:
    LDI r0, 0
    STORE r11, r0         ; null terminate filename

    ; Check for empty filename
    LDI r11, 0x2200
    LOAD r0, r11
    JZ r0, head_err

    ; Open file
    LDI r1, 0x2200
    LDI r2, 0
    OPEN r1, r2
    LDI r1, 0xFFFFFFFF
    CMP r0, r1
    JZ r0, head_err

    MOV r5, r0
    LDI r3, 0x2000
    LDI r4, 400
    READ r5, r3, r4
    CLOSE r5

    ; Null terminate
    LDI r6, 0x2000
    ADD r6, r0
    LDI r7, 0
    STORE r6, r7

    ; Display first N lines
    LDI r10, 0x2000       ; file pointer
    LDI r11, 0x2400       ; line buffer
    LDI r13, 0            ; line count
    LDI r12, 0            ; chars in line

head_read_line:
    LOAD r0, r10
    JZ r0, head_done      ; end of file

    LDI r1, 10
    CMP r0, r1
    JZ r0, head_print_line

    STORE r11, r0
    LDI r1, 1
    ADD r10, r1
    ADD r11, r1
    ADD r12, r1
    LDI r1, 32
    CMP r12, r1
    BLT r0, head_read_line
    ; Line too long, print what we have
    JMP head_print_line

head_print_line:
    ; Null terminate
    LDI r0, 0
    STORE r11, r0
    ; Display
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, 0x2400
    TEXT r2, r1, r3

    ; Increment line count, check limit
    LDI r1, 1
    ADD r13, r1
    CMP r13, r14
    BGE r0, head_done

    ; Skip newline if present
    LOAD r0, r10
    LDI r1, 10
    CMP r0, r1
    JZ r0, head_skip_nl
    JMP head_reset_line

head_skip_nl:
    LDI r1, 1
    ADD r10, r1

head_reset_line:
    LDI r11, 0x2400
    LDI r12, 0
    JMP head_read_line

head_done:
    POP r10
    POP r11
    POP r12
    POP r13
    POP r14
    POP r15
    JMP exec_done

head_err:
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, head_usage_msg
    TEXT r2, r1, r3
    POP r10
    POP r11
    POP r12
    POP r13
    POP r14
    POP r15
    JMP exec_done

do_tail:
    ; tail <file> [N] -- display last N lines (default 10)
    ; Strategy: read whole file, count newlines, display last N
    PUSH r15
    PUSH r14
    PUSH r13
    PUSH r12
    PUSH r11
    PUSH r10

    ; Parse: filename at 0x0600, optional number
    LDI r10, 0x0600
    LDI r11, 0x2200

tail_copy_name:
    LOAD r0, r10
    JZ r0, tail_name_done
    LDI r1, 32
    CMP r0, r1
    JZ r0, tail_parse_n
    STORE r11, r0
    LDI r1, 1
    ADD r10, r1
    ADD r11, r1
    JMP tail_copy_name

tail_parse_n:
    LDI r1, 1
    ADD r10, r1
    LDI r14, 10           ; default N = 10
    LOAD r0, r10
    JZ r0, tail_name_done
    LDI r1, 48
    SUB r0, r1
    LDI r1, 1
    CMP r0, r1
    BLT r0, tail_name_done
    LDI r1, 9
    CMP r0, r1
    BGE r0, tail_name_done
    MOV r14, r0

tail_name_done:
    LDI r0, 0
    STORE r11, r0

    LDI r11, 0x2200
    LOAD r0, r11
    JZ r0, tail_err

    ; Open and read file
    LDI r1, 0x2200
    LDI r2, 0
    OPEN r1, r2
    LDI r1, 0xFFFFFFFF
    CMP r0, r1
    JZ r0, tail_err

    MOV r5, r0
    LDI r3, 0x2000
    LDI r4, 400
    READ r5, r3, r4
    CLOSE r5

    LDI r6, 0x2000
    ADD r6, r0
    LDI r7, 0
    STORE r6, r7

    ; Count total lines
    LDI r10, 0x2000
    LDI r13, 1            ; line count (at least 1)

tail_count_lines:
    LOAD r0, r10
    JZ r0, tail_count_done
    LDI r1, 10
    CMP r0, r1
    JNZ r0, tail_count_next
    LDI r1, 1
    ADD r13, r1           ; increment line count
tail_count_next:
    LDI r1, 1
    ADD r10, r1
    JMP tail_count_lines

tail_count_done:
    ; Compute start line: total_lines - N (but min 1)
    MOV r11, r13           ; total_lines
    SUB r11, r14           ; total - N
    LDI r1, 1
    CMP r11, r1
    BGE r0, tail_skip_ok
    MOV r11, r1            ; at least line 1

tail_skip_ok:
    ; Skip to start line
    LDI r10, 0x2000
    LDI r13, 1             ; current line

tail_skip_loop:
    CMP r13, r11
    BGE r0, tail_display   ; reached start line

tail_skip_next:
    LOAD r0, r10
    JZ r0, tail_done       ; end of file
    LDI r1, 10
    CMP r0, r1
    JNZ r0, tail_skip_adv
    LDI r1, 1
    ADD r13, r1            ; next line on newline
tail_skip_adv:
    LDI r1, 1
    ADD r10, r1
    JMP tail_skip_loop

tail_display:
    ; Display remaining lines
    LDI r11, 0x2400       ; line buffer
    LDI r12, 0            ; chars in line

tail_read_char:
    LOAD r0, r10
    JZ r0, tail_flush
    LDI r1, 10
    CMP r0, r1
    JZ r0, tail_flush

    STORE r11, r0
    LDI r1, 1
    ADD r10, r1
    ADD r11, r1
    ADD r12, r1
    LDI r1, 32
    CMP r12, r1
    BLT r0, tail_read_char
    JMP tail_flush

tail_flush:
    LDI r0, 0
    STORE r11, r0
    ; Display line
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, 0x2400
    TEXT r2, r1, r3

    ; Check if we consumed a newline
    LOAD r0, r10
    LDI r1, 10
    CMP r0, r1
    JZ r0, tail_skip_newline

tail_reset:
    LDI r11, 0x2400
    LDI r12, 0
    LOAD r0, r10
    JZ r0, tail_done
    JMP tail_read_char

tail_skip_newline:
    LDI r1, 1
    ADD r10, r1
    JMP tail_reset

tail_done:
    POP r10
    POP r11
    POP r12
    POP r13
    POP r14
    POP r15
    JMP exec_done

tail_err:
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, tail_usage_msg
    TEXT r2, r1, r3
    POP r10
    POP r11
    POP r12
    POP r13
    POP r14
    POP r15
    JMP exec_done

do_wc:
    ; wc <file> -- count lines, words, and bytes
    PUSH r15
    PUSH r14
    PUSH r13
    PUSH r12
    PUSH r11
    PUSH r10

    ; Check for argument
    LDI r9, 0x0600
    LOAD r0, r9
    JZ r0, wc_err

    ; Open file
    LDI r1, 0x0600
    LDI r2, 0
    OPEN r1, r2
    LDI r1, 0xFFFFFFFF
    CMP r0, r1
    JZ r0, wc_err

    MOV r5, r0
    LDI r3, 0x2000
    LDI r4, 400
    READ r5, r3, r4
    MOV r12, r0           ; save byte count
    CLOSE r5

    ; Null terminate
    LDI r6, 0x2000
    ADD r6, r0
    LDI r7, 0
    STORE r6, r7

    ; Count lines and words
    LDI r10, 0x2000       ; file pointer
    LDI r13, 0            ; line count
    LDI r14, 0            ; word count
    LDI r15, 0            ; prev was space (1=yes, 0=no)

wc_scan:
    LOAD r0, r10
    JZ r0, wc_format      ; end of file

    ; Count newlines
    LDI r1, 10
    CMP r0, r1
    JNZ r0, wc_not_nl
    LDI r1, 1
    ADD r13, r1           ; line++
    LDI r15, 1            ; prev = space
    JMP wc_next

wc_not_nl:
    ; Count words: space or other whitespace transitions
    LDI r1, 32            ; space
    CMP r0, r1
    JNZ r0, wc_not_space
    LDI r15, 1            ; prev = space
    JMP wc_next

wc_not_space:
    ; If prev was space and current is not, it is a new word
    LDI r1, 1
    CMP r15, r1
    JNZ r0, wc_next
    ADD r14, r1           ; word++
    LDI r15, 0            ; prev = not space

wc_next:
    LDI r1, 1
    ADD r10, r1
    JMP wc_scan

wc_format:
    ; Build output string at 0x2400: "N N N"
    ; Format: lines words bytes
    LDI r11, 0x2400

    ; Convert lines (r13) to decimal
    CALL wc_utoa
    ; Add space
    LDI r0, 32
    STORE r11, r0
    LDI r1, 1
    ADD r11, r1

    ; Convert words (r14) to decimal
    MOV r10, r14
    CALL wc_utoa
    ; Add space
    LDI r0, 32
    STORE r11, r0
    LDI r1, 1
    ADD r11, r1

    ; Convert bytes (r12) to decimal
    MOV r10, r12
    CALL wc_utoa
    ; Null terminate
    LDI r0, 0
    STORE r11, r0

    ; Display
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, 0x2400
    TEXT r2, r1, r3
    JMP wc_cleanup

wc_utoa:
    ; Convert r10 to decimal, write to buffer at r11
    ; Modifies r10, does not change r11 (caller manages it)
    PUSH r15
    ; Handle 0 case
    JNZ r10, wc_utoa_nonzero
    LDI r0, 48            ; '0'
    STORE r11, r0
    LDI r1, 1
    ADD r11, r1
    POP r15
    RET

wc_utoa_nonzero:
    ; Find number of digits by repeated division
    LDI r15, 0            ; digit count
    LDI r13, 10
    MOV r14, r10          ; temp copy

wc_count_digits:
    JZ r14, wc_do_digits
    LDI r1, 10
    DIV r14, r1
    LDI r1, 1
    ADD r15, r1
    JMP wc_count_digits

wc_do_digits:
    ; r15 = digit count. We need to write digits from most significant.
    ; Write digits to a temp area at 0x2500, then copy in order.
    LDI r13, 0x2500       ; temp digit buffer
    LDI r14, 0            ; digit index
    MOV r10, r14          ; restore original? No, r10 was modified.
    ; Actually we need to re-do the conversion. Let me use a simpler approach:
    ; Write digits in reverse order, then reverse them.
    ; Even simpler: since max bytes ~400, max 3 digits. Handle up to 999.
    POP r15
    PUSH r15
    PUSH r14
    PUSH r13
    PUSH r12

    ; Save r11 (output pointer)
    MOV r12, r11

    ; Write digits in reverse at 0x2500
    LDI r13, 0x2500
    LDI r14, 0            ; digit count

wc_div_loop:
    JZ r10, wc_rev_digits
    LDI r1, 10
    DIV r10, r1
    LDI r1, 48            ; '0'
    ADD r0, r1            ; r0 = digit char
    STORE r13, r0
    LDI r1, 1
    ADD r13, r1
    ADD r14, r1
    JMP wc_div_loop

wc_rev_digits:
    ; r14 = digit count at 0x2500 (reversed)
    ; Copy in reverse order to output
    JZ r14, wc_utoa_done
    LDI r1, 1
    SUB r14, r1
    LDI r13, 0x2500
    ADD r13, r14
    LOAD r0, r13
    STORE r12, r0
    LDI r1, 1
    ADD r12, r1
    JMP wc_rev_digits

wc_utoa_done:
    MOV r11, r12          ; update output pointer
    POP r12
    POP r13
    POP r14
    POP r15
    POP r15
    RET

wc_err:
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, wc_usage_msg
    TEXT r2, r1, r3
wc_cleanup:
    POP r10
    POP r11
    POP r12
    POP r13
    POP r14
    POP r15
    JMP exec_done

do_date:
    ; Display ticks since boot (proxy for uptime)
    PUSH r15
    PUSH r14
    PUSH r13
    PUSH r12

    ; Read TICKS from RAM[0xFFE]
    LDI r9, 0xFFE
    LOAD r10, r9           ; r10 = ticks

    ; Build output: "ticks: NNNN" at 0x2400
    LDI r11, 0x2400
    ; Write "ticks: "
    LDI r0, 116           ; t
    STORE r11, r0
    LDI r1, 1
    ADD r11, r1
    LDI r0, 105           ; i
    STORE r11, r0
    ADD r11, r1
    LDI r0, 99            ; c
    STORE r11, r0
    ADD r11, r1
    LDI r0, 107           ; k
    STORE r11, r0
    ADD r11, r1
    LDI r0, 115           ; s
    STORE r11, r0
    ADD r11, r1
    LDI r0, 58            ; :
    STORE r11, r0
    ADD r11, r1
    LDI r0, 32            ; space
    STORE r11, r0
    ADD r11, r1

    ; Convert ticks to decimal
    CALL date_utoa

    ; Null terminate
    LDI r0, 0
    STORE r11, r0

    ; Display
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r2, 4
    LDI r3, 0x2400
    TEXT r2, r1, r3

    POP r12
    POP r13
    POP r14
    POP r15
    JMP exec_done

date_utoa:
    ; Convert r10 to decimal, write to buffer at r11
    PUSH r15
    PUSH r14
    PUSH r13
    PUSH r12

    MOV r12, r11

    ; Handle 0
    JNZ r10, date_nonzero
    LDI r0, 48
    STORE r11, r0
    LDI r1, 1
    ADD r11, r1
    POP r12
    POP r13
    POP r14
    POP r15
    RET

date_nonzero:
    ; Write digits in reverse at 0x2600
    LDI r13, 0x2600
    LDI r14, 0

date_div:
    JZ r10, date_rev
    LDI r1, 10
    DIV r10, r1
    LDI r1, 48
    ADD r0, r1
    STORE r13, r0
    LDI r1, 1
    ADD r13, r1
    ADD r14, r1
    JMP date_div

date_rev:
    JZ r14, date_done
    LDI r1, 1
    SUB r14, r1
    LDI r13, 0x2600
    ADD r13, r14
    LOAD r0, r13
    STORE r12, r0
    LDI r1, 1
    ADD r12, r1
    JMP date_rev

date_done:
    MOV r11, r12
    POP r12
    POP r13
    POP r14
    POP r15
    RET

do_exec:
    ; Execute external program via EXEC
    ; Command name at 0x0400
    LDI r1, 0x0400
    EXEC r1               ; r0 = PID or error
    ; Check for error
    LDI r2, 0xFFFFFFFF
    CMP r0, r2
    JZ r0, exec_error

    ; Save PID
    LDI r9, 0x1202
    STORE r9, r0

    ; Wait for child to complete
exec_wait:
    LDI r1, 0x1202
    LOAD r1, r9
    WAITPID r1
    JZ r0, exec_wait     ; still running

    ; Check for pipe mode
    LDI r9, 0x1207
    LOAD r0, r9
    LDI r1, 1
    CMP r0, r1
    JZ r0, exec_pipe

    JMP exec_done

exec_pipe:
    ; Execute second command from pipe buffer
    LDI r1, 0x1400
    EXEC r1
    LDI r9, 0x1202
    STORE r9, r0
exec_pipe_wait:
    LDI r1, 0x1202
    LOAD r1, r9
    WAITPID r1
    JZ r0, exec_pipe_wait
    JMP exec_done

exec_error:
    ; Display "command not found"
    LDI r9, 0x1201
    LOAD r1, r9
    LDI r0, 12
    ADD r1, r0
    STORE r9, r1
    LDI r3, not_found_msg
    LDI r2, 4
    TEXT r2, r1, r3
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

.org 0x1AD0

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
    .byte 103 ; g
    .byte 101 ; e
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

.org 0x1B10

; Config buffer for hypervisor arguments (256 bytes: 0x1B10 - 0x1C0F)
; Written by do_hypervisor, read by HYPERVISOR opcode

.org 0x1C00

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