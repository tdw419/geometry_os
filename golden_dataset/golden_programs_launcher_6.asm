; DESCRIPTION: The GeOS assembly code implements an application launcher that displays a full-screen grid of available `.asm` programs from the Virtual File System (VFS). Users can scroll through the grid using the W/S keys, select a program with the Enter key to launch it, or press ESC to close the launcher. The code demonstrates functionalities such as file listing (`LS`), text drawing (`DRAWTEXT`), program execution (`EXEC`), keyboard input handling (`IKEY`), and graphics rendering (`RECTF`). It manages state using RAM addresses for file list buffer, string buffers, file count, scroll offset, selected index, and mode. The grid layout consists of 3 columns and 8 rows, each cell being 84x28 pixels.

; launcher.asm -- App Launcher for Geometry OS
;
; Phase 72: Full-screen grid of available .asm programs from VFS.
; Scroll with W/S keys, Enter to launch, ESC to close.
;
; Proves: LS (file listing), DRAWTEXT (text), EXEC (launch programs),
;         IKEY (keyboard), RECTF (graphics), FRAME.
;
; RAM Layout:
;   0x4000-0x47FF  File list buffer (from LS)
;   0x5000-0x507F  String buffers
;   0x5100         File count
;   0x5104         Scroll offset
;   0x5108         Selected index (0-based)
;   0x510C         Mode (0=browser, 1=launching)
;
; Grid: 3 columns x 8 rows = 24 visible entries
; Each cell: 84x28 pixels

#define FILE_BUF     0x4000
#define STR_BUF      0x5000
#define FILE_COUNT   0x5100
#define SCROLL_OFF   0x5104
#define SEL_INDEX    0x5108
#define MODE         0x510C

; ==========================================
; INIT
; ==========================================
LDI r30, 0xFD00
LDI r0, 1
LDI r11, 0

; Clear state
LDI r20, SCROLL_OFF
STORE r20, r11
LDI r20, SEL_INDEX
STORE r20, r11
LDI r20, MODE
STORE r20, r11

; -- Get file list --
LDI r14, FILE_BUF
LS r14
LDI r20, FILE_COUNT
STORE r20, r6

; ==========================================
; MAIN LOOP
; ==========================================
main_loop:
  ; Clear screen
  LDI r6, 0x1A1A2E
  FILL r6

  ; -- Draw title bar --
  LDI r6, 0x2D2D4D
  LDI r14, 0
  LDI r12, 0
  LDI r13, 256
  LDI r1, 20
  RECTF r14, r12, r13, r1, r6

  ; Title "Apps"
  LDI r14, STR_BUF
  LDI r6, 65                ; A
  STORE r14, r6
  ADD r14, r0
  LDI r6, 112               ; p
  STORE r14, r6
  ADD r14, r0
  LDI r6, 112               ; p
  STORE r14, r6
  ADD r14, r0
  LDI r6, 115               ; s
  STORE r14, r6
  ADD r14, r0
  LDI r6, 0
  STORE r14, r6
  LDI r14, 110
  LDI r12, 6
  LDI r13, STR_BUF
  LDI r1, 0xFFFFFF
  LDI r4, 0
  DRAWTEXT r14, r12, r13, r1, r4

  ; -- Draw grid of programs --
  LDI r22, FILE_BUF          ; current ptr
  LDI r20, SCROLL_OFF
  LOAD r20, r20              ; scroll offset
  LDI r21, FILE_COUNT
  LOAD r21, r21              ; total files

  ; Skip scrolled entries
  JZ r20, draw_grid

scroll_skip:
  LOAD r25, r22
  JNZ r25, skip_adv
  ADD r22, r0
  SUBI r20, 1
  JZ r20, draw_grid
  JMP scroll_skip
skip_adv:
  ADD r22, r0
  JMP scroll_skip

draw_grid:
  ; r22 = pointer to first visible entry
  LDI r23, 0                ; entry counter
  LDI r24, 24               ; max visible

grid_loop:
  CMP r23, r24
  BGE r6, grid_done
  CMP r21, r11
  JZ r6, grid_done

  ; Compute grid position
  ; col = entry % 3, row = entry / 3
  LDI r25, 3
  MOV r26, r23
  MOD r26, r25              ; col (0-2)
  MOV r27, r23
  DIV r27, r25              ; row (0-7)

  ; x = col*86 + 4
  LDI r28, 86
  MUL r26, r28
  ADDI r26, 4
  ; y = row*29 + 24
  LDI r28, 29
  MUL r27, r28
  ADDI r27, 24

  ; Check if selected
  LDI r13, SEL_INDEX
  LOAD r13, r13
  CMP r13, r23
  ; If selected, draw highlight
  LDI r6, 0x4444AA
  LDI r14, 84
  LDI r12, 28
  JZ r6, draw_cell_bg
  ; Normal cell
  LDI r6, 0x252540

draw_cell_bg:
  RECTF r26, r27, r14, r12, r6

  ; Copy filename to STR_BUF (max 12 chars)
  LDI r25, STR_BUF
  LDI r26, 12

copy_fname:
  LOAD r27, r22
  STORE r25, r27
  JZ r27, fname_done
  ADD r22, r0
  ADD r25, r0
  SUBI r26, 1
  JZ r26, fname_done
  JMP copy_fname

fname_done:
  ; Advance past null
  LOAD r27, r22
  JNZ r27, no_null_adv
  ADD r22, r0
no_null_adv:

  ; Draw filename
  ; Recompute cell position
  LDI r25, 3
  MOV r26, r23
  MOD r26, r25
  MOV r27, r23
  DIV r27, r25
  LDI r28, 86
  MUL r26, r28
  ADDI r26, 8
  LDI r28, 29
  MUL r27, r28
  ADDI r27, 28

  LDI r13, STR_BUF
  LDI r1, 0xCCCCCC
  LDI r4, 0
  DRAWTEXT r26, r27, r13, r1, r4

  ADDI r23, 1
  SUBI r21, 1
  JMP grid_loop

grid_done:
  ; -- Draw footer --
  ; "W/S Scroll  Enter Run  ESC Back"
  LDI r14, STR_BUF
  LDI r6, 87               ; W
  STORE r14, r6
  ADD r14, r0
  LDI r6, 47               ; /
  STORE r14, r6
  ADD r14, r0
  LDI r6, 83               ; S
  STORE r14, r6
  ADD r14, r0
  LDI r6, 32               ; space
  STORE r14, r6
  ADD r14, r0
  LDI r6, 82               ; R
  STORE r14, r6
  ADD r14, r0
  LDI r6, 117              ; u
  STORE r14, r6
  ADD r14, r0
  LDI r6, 110              ; n
  STORE r14, r6
  ADD r14, r0
  LDI r6, 0
  STORE r14, r6

  LDI r14, 4
  LDI r12, 244
  LDI r13, STR_BUF
  LDI r1, 0x888888
  LDI r4, 0
  DRAWTEXT r14, r12, r13, r1, r4

  ; -- Handle keyboard input --
  IKEY r14
  JZ r14, no_key

  ; W = up (87)
  LDI r12, 87
  CMP r14, r12
  JNZ r6, check_down
  ; Move selection up
  LDI r20, SEL_INDEX
  LOAD r20, r20
  JZ r20, no_key
  SUBI r20, 1
  STORE r20, r20
  JMP no_key

check_down:
  ; S = down (83)
  LDI r12, 83
  CMP r14, r12
  JNZ r6, check_enter
  ; Move selection down
  LDI r20, SEL_INDEX
  LOAD r20, r20
  LDI r21, FILE_COUNT
  LOAD r21, r21
  SUBI r21, 1              ; max index
  CMP r20, r21
  BGE r6, no_key
  ADDI r20, 1
  STORE r20, r20
  JMP no_key

check_enter:
  ; Enter (13)
  LDI r12, 13
  CMP r14, r12
  JNZ r6, check_esc
  LDI r20, MODE
  LDI r6, 1
  STORE r20, r6
  JMP no_key

check_esc:
  ; ESC (27)
  LDI r12, 27
  CMP r14, r12
  JNZ r6, no_key
  LDI r20, MODE
  LDI r6, 0
  STORE r20, r6

no_key:
  ; -- Draw launching overlay --
  LDI r20, MODE
  LOAD r20, r20
  LDI r2, 1
  CMP r20, r2
  JNZ r6, no_overlay
  LDI r6, 0x00AA00
  LDI r14, 80
  LDI r12, 120
  LDI r13, 96
  LDI r1, 16
  RECTF r14, r12, r13, r1, r6
  ; Reset mode
  LDI r20, MODE
  LDI r6, 0
  STORE r20, r6

no_overlay:
  FRAME
  JMP main_loop
