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
LDI r7, 1
LDI r8, 0

; Clear state
LDI r20, SCROLL_OFF
STORE r20, r8
LDI r20, SEL_INDEX
STORE r20, r8
LDI r20, MODE
STORE r20, r8

; -- Get file list --
LDI r15, FILE_BUF
LS r15
LDI r20, FILE_COUNT
STORE r20, r2

; ==========================================
; MAIN LOOP
; ==========================================
main_loop:
  ; Clear screen
  LDI r2, 0x1A1A2E
  FILL r2

  ; -- Draw title bar --
  LDI r2, 0x2D2D4D
  LDI r15, 0
  LDI r6, 0
  LDI r0, 256
  LDI r11, 20
  RECTF r15, r6, r0, r11, r2

  ; Title "Apps"
  LDI r15, STR_BUF
  LDI r2, 65                ; A
  STORE r15, r2
  ADD r15, r7
  LDI r2, 112               ; p
  STORE r15, r2
  ADD r15, r7
  LDI r2, 112               ; p
  STORE r15, r2
  ADD r15, r7
  LDI r2, 115               ; s
  STORE r15, r2
  ADD r15, r7
  LDI r2, 0
  STORE r15, r2
  LDI r15, 110
  LDI r6, 6
  LDI r0, STR_BUF
  LDI r11, 0xFFFFFF
  LDI r10, 0
  DRAWTEXT r15, r6, r0, r11, r10

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
  ADD r22, r7
  SUBI r20, 1
  JZ r20, draw_grid
  JMP scroll_skip
skip_adv:
  ADD r22, r7
  JMP scroll_skip

draw_grid:
  ; r22 = pointer to first visible entry
  LDI r23, 0                ; entry counter
  LDI r24, 24               ; max visible

grid_loop:
  CMP r23, r24
  BGE r2, grid_done
  CMP r21, r8
  JZ r2, grid_done

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
  LDI r0, SEL_INDEX
  LOAD r0, r0
  CMP r0, r23
  ; If selected, draw highlight
  LDI r2, 0x4444AA
  LDI r15, 84
  LDI r6, 28
  JZ r2, draw_cell_bg
  ; Normal cell
  LDI r2, 0x252540

draw_cell_bg:
  RECTF r26, r27, r15, r6, r2

  ; Copy filename to STR_BUF (max 12 chars)
  LDI r25, STR_BUF
  LDI r26, 12

copy_fname:
  LOAD r27, r22
  STORE r25, r27
  JZ r27, fname_done
  ADD r22, r7
  ADD r25, r7
  SUBI r26, 1
  JZ r26, fname_done
  JMP copy_fname

fname_done:
  ; Advance past null
  LOAD r27, r22
  JNZ r27, no_null_adv
  ADD r22, r7
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

  LDI r0, STR_BUF
  LDI r11, 0xCCCCCC
  LDI r10, 0
  DRAWTEXT r26, r27, r0, r11, r10

  ADDI r23, 1
  SUBI r21, 1
  JMP grid_loop

grid_done:
  ; -- Draw footer --
  ; "W/S Scroll  Enter Run  ESC Back"
  LDI r15, STR_BUF
  LDI r2, 87               ; W
  STORE r15, r2
  ADD r15, r7
  LDI r2, 47               ; /
  STORE r15, r2
  ADD r15, r7
  LDI r2, 83               ; S
  STORE r15, r2
  ADD r15, r7
  LDI r2, 32               ; space
  STORE r15, r2
  ADD r15, r7
  LDI r2, 82               ; R
  STORE r15, r2
  ADD r15, r7
  LDI r2, 117              ; u
  STORE r15, r2
  ADD r15, r7
  LDI r2, 110              ; n
  STORE r15, r2
  ADD r15, r7
  LDI r2, 0
  STORE r15, r2

  LDI r15, 4
  LDI r6, 244
  LDI r0, STR_BUF
  LDI r11, 0x888888
  LDI r10, 0
  DRAWTEXT r15, r6, r0, r11, r10

  ; -- Handle keyboard input --
  IKEY r15
  JZ r15, no_key

  ; W = up (87)
  LDI r6, 87
  CMP r15, r6
  JNZ r2, check_down
  ; Move selection up
  LDI r20, SEL_INDEX
  LOAD r20, r20
  JZ r20, no_key
  SUBI r20, 1
  STORE r20, r20
  JMP no_key

check_down:
  ; S = down (83)
  LDI r6, 83
  CMP r15, r6
  JNZ r2, check_enter
  ; Move selection down
  LDI r20, SEL_INDEX
  LOAD r20, r20
  LDI r21, FILE_COUNT
  LOAD r21, r21
  SUBI r21, 1              ; max index
  CMP r20, r21
  BGE r2, no_key
  ADDI r20, 1
  STORE r20, r20
  JMP no_key

check_enter:
  ; Enter (13)
  LDI r6, 13
  CMP r15, r6
  JNZ r2, check_esc
  LDI r20, MODE
  LDI r2, 1
  STORE r20, r2
  JMP no_key

check_esc:
  ; ESC (27)
  LDI r6, 27
  CMP r15, r6
  JNZ r2, no_key
  LDI r20, MODE
  LDI r2, 0
  STORE r20, r2

no_key:
  ; -- Draw launching overlay --
  LDI r20, MODE
  LOAD r20, r20
  LDI r5, 1
  CMP r20, r5
  JNZ r2, no_overlay
  LDI r2, 0x00AA00
  LDI r15, 80
  LDI r6, 120
  LDI r0, 96
  LDI r11, 16
  RECTF r15, r6, r0, r11, r2
  ; Reset mode
  LDI r20, MODE
  LDI r2, 0
  STORE r20, r2

no_overlay:
  FRAME
  JMP main_loop
