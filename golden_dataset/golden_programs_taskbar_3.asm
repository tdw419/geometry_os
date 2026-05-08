; DESCRIPTION: This GeOS assembly code implements a persistent taskbar at the bottom of the screen for a desktop environment. The taskbar includes a Start button, running process icons, a frame counter (clock), and supports clickable regions for menu interactions. It manages process listing, mouse input, text rendering, file listing, and maintains state in specific RAM locations.

; taskbar.asm -- Desktop Taskbar for Geometry OS
;
; Phase 72: Persistent taskbar at bottom of screen with running process
; icons, frame counter (clock), and Start button.
;
; Proves: PROCLS (process listing), MOUSEQ (mouse input), HITSET/HITQ
;         (clickable regions), DRAWTEXT (text rendering), LS (file listing).
;
; RAM Layout:
;   0x4000-0x407F  Process PID buffer (from PROCLS)
;   0x4080-0x47FF  File list buffer (from LS)
;   0x5000-0x50FF  String scratch buffers
;   0x5100         Process count
;   0x5104         File count
;   0x5108         Start menu open (0=closed, 1=open)
;   0x510C         Scroll offset for file list
;   0x5110         Selected file index
;   0x5114         Tick counter backup
;
; Taskbar: y=240..255 (bottom 16 pixels)
; Start button: x=0..47, y=240..255
; Process info: x=48..200
; Clock: x=200..255

#define PID_BUF      0x4000
#define FILE_BUF     0x4080
#define STR_BUF      0x5000
#define PROC_COUNT   0x5100
#define FILE_COUNT   0x5104
#define MENU_OPEN    0x5108
#define SCROLL_OFF   0x510C
#define SEL_INDEX    0x5110
#define TICK_BAK     0x5114
#define TBAR_Y       240
#define TBAR_H       16

; ==========================================
; INIT
; ==========================================
LDI r30, 0xFD00           ; stack pointer
LDI r8, 1
LDI r4, 0                 ; zero constant

; Clear state
LDI r20, MENU_OPEN
STORE r20, r4
LDI r20, SCROLL_OFF
STORE r20, r4
LDI r20, SEL_INDEX
STORE r20, r4

; ==========================================
; MAIN LOOP
; ==========================================
main_loop:
  ; -- Draw desktop area (above taskbar) --
  LDI r14, 0x181828
  FILL r14

  ; -- Draw taskbar background --
  LDI r14, 0x2D2D3D        ; dark blue-gray
  LDI r7, 0
  LDI r9, TBAR_Y
  LDI r13, 256
  LDI r12, TBAR_H
  RECTF r7, r9, r13, r12, r14

  ; -- Draw Start button --
  LDI r14, 0x4444AA         ; blue
  LDI r7, 1
  LDI r9, TBAR_Y
  ADDI r9, 1
  LDI r13, 46
  LDI r12, 14
  RECTF r7, r9, r13, r12, r14

  ; Write "Start" to STR_BUF
  LDI r7, STR_BUF
  LDI r14, 83               ; S
  STORE r7, r14
  ADD r7, r8
  LDI r14, 116              ; t
  STORE r7, r14
  ADD r7, r8
  LDI r14, 97               ; a
  STORE r7, r14
  ADD r7, r8
  LDI r14, 114              ; r
  STORE r7, r14
  ADD r7, r8
  LDI r14, 116              ; t
  STORE r7, r14
  ADD r7, r8
  LDI r14, 0                ; null
  STORE r7, r14

  ; Draw Start text
  LDI r7, 8
  LDI r9, TBAR_Y
  ADDI r9, 4
  LDI r13, STR_BUF
  LDI r12, 0xFFFFFF
  LDI r6, 0
  DRAWTEXT r7, r9, r13, r12, r6

  ; -- Get running processes via PROCLS --
  LDI r7, PID_BUF
  PROCLS r7
  ; r14 = process count
  LDI r20, PROC_COUNT
  STORE r20, r14

  ; -- Draw process count on taskbar as "P:N" --
  LDI r7, STR_BUF
  LDI r14, 80               ; P
  STORE r7, r14
  ADD r7, r8
  LDI r14, 58               ; :
  STORE r7, r14
  ADD r7, r8
  ; Convert process count to ASCII digit
  LDI r20, PROC_COUNT
  LOAD r20, r20
  LDI r14, 48               ; 0
  ADD r14, r20
  STORE r7, r14
  ADD r7, r8
  LDI r14, 0
  STORE r7, r14

  LDI r7, 52
  LDI r9, TBAR_Y
  ADDI r9, 4
  LDI r13, STR_BUF
  LDI r12, 0x00FF00
  LDI r6, 0
  DRAWTEXT r7, r9, r13, r12, r6

  ; -- Draw frame counter (clock) at right side --
  ; TICKS / 60 = seconds, seconds / 60 = minutes
  LDI r20, 0xFFE
  LOAD r20, r20             ; TICKS
  LDI r21, 60
  DIV r20, r21              ; seconds
  LDI r21, 60
  DIV r20, r21              ; minutes
  LDI r21, 10
  MOD r20, r21              ; minutes mod 10
  LDI r14, 48
  ADD r14, r20               ; ASCII digit for minutes
  LDI r7, STR_BUF
  STORE r7, r14
  ADD r7, r8
  LDI r14, 58                ; :
  STORE r7, r14
  ADD r7, r8
  ; seconds
  LDI r20, 0xFFE
  LOAD r20, r20
  LDI r21, 60
  DIV r20, r21              ; total seconds
  LDI r21, 10
  MOD r20, r21              ; seconds mod 10
  LDI r14, 48
  ADD r14, r20
  STORE r7, r14
  ADD r7, r8
  LDI r14, 0
  STORE r7, r14

  LDI r7, 232
  LDI r9, TBAR_Y
  ADDI r9, 4
  LDI r13, STR_BUF
  LDI r12, 0xAAAAFF
  LDI r6, 0
  DRAWTEXT r7, r9, r13, r12, r6

  ; -- Register hit region for Start button --
  LDI r7, 1               ; x
  LDI r9, TBAR_Y
  ADDI r9, 1              ; y
  LDI r13, 46              ; w
  LDI r12, 14              ; h
  HITSET r7, r9, r13, r12, 1

  ; -- Check mouse --
  MOUSEQ r7                ; r7=mx, r9=my, r13=btn

  ; Check for click (btn==2)
  LDI r12, 2
  CMP r13, r12
  BNE_check:
  ; BNE not available -- use JNZ on difference
  MOV r2, r13
  SUB r2, r12              ; r2 = btn - 2
  JNZ r2, no_click

  ; Something was clicked -- check what
  HITQ r6                  ; r6 = hit region id

  ; Start button (id==1)?
  LDI r2, 1
  CMP r6, r2
  JNZ r14, check_menu_click

  ; Toggle menu
  LDI r20, MENU_OPEN
  LOAD r21, r20
  LDI r2, 1
  CMP r21, r2
  JNZ r14, open_menu
  ; Close menu
  LDI r14, 0
  STORE r20, r14
  JMP no_click

open_menu:
  LDI r14, 1
  STORE r20, r14
  ; Refresh file list
  LDI r7, FILE_BUF
  LS r7
  LDI r20, FILE_COUNT
  STORE r20, r14
  LDI r20, SCROLL_OFF
  LDI r14, 0
  STORE r20, r14
  LDI r20, SEL_INDEX
  STORE r20, r14
  JMP no_click

check_menu_click:
  ; Menu item (id >= 10)? If r6 < 10, skip
  LDI r2, 10
  CMP r6, r2
  BLT r14, no_click

  ; Close menu on selection
  LDI r20, MENU_OPEN
  LDI r14, 0
  STORE r20, r14
  JMP no_click

no_click:
  ; -- Draw menu if open --
  LDI r20, MENU_OPEN
  LOAD r20, r20
  LDI r2, 1
  CMP r20, r2
  JNZ r14, skip_menu

  ; Menu background
  LDI r14, 0x303050
  LDI r7, 0
  LDI r9, 144
  LDI r13, 120
  LDI r12, 96
  RECTF r7, r9, r13, r12, r14

  ; Menu border
  LDI r14, 0x6666AA
  LDI r7, 0
  LDI r9, 144
  LDI r13, 120
  LDI r12, 96
  RECT r7, r9, r13, r12, r14

  ; Menu title "Apps"
  LDI r7, STR_BUF
  LDI r14, 65                ; A
  STORE r7, r14
  ADD r7, r8
  LDI r14, 112               ; p
  STORE r7, r14
  ADD r7, r8
  LDI r14, 112               ; p
  STORE r7, r14
  ADD r7, r8
  LDI r14, 115               ; s
  STORE r7, r14
  ADD r7, r8
  LDI r14, 0
  STORE r7, r14
  LDI r7, 4
  LDI r9, 148
  LDI r13, STR_BUF
  LDI r12, 0xFFFFFF
  LDI r6, 0
  DRAWTEXT r7, r9, r13, r12, r6

  ; Draw file list entries (up to 4 visible)
  LDI r22, 0                ; visible entry counter
  LDI r23, 4                ; max visible
  LDI r24, FILE_BUF          ; filename ptr
  LDI r20, FILE_COUNT
  LOAD r20, r20             ; total files

draw_entries:
  CMP r22, r23
  BGE r14, entries_done
  CMP r20, r4
  JZ r14, entries_done

  ; Copy filename to STR_BUF
  LDI r25, STR_BUF
  LDI r26, 12               ; max chars
copy_name:
  LOAD r27, r24
  STORE r25, r27
  JZ r27, name_done
  ADD r24, r8
  ADD r25, r8
  SUBI r26, 1
  JZ r26, name_done
  JMP copy_name

name_done:
  ; Draw filename
  LDI r7, 4
  LDI r9, 164
  MOV r13, r22
  LDI r28, 14
  MUL r13, r28
  ADD r9, r13              ; y = 164 + entry * 14
  LDI r13, STR_BUF
  LDI r12, 0xCCCCFF
  LDI r6, 0
  DRAWTEXT r7, r9, r13, r12, r6

  ; Advance r24 past null
  LOAD r27, r24
  JNZ r27, no_adv
  ADD r24, r8
no_adv:

  ADDI r22, 1
  SUBI r20, 1
  JMP draw_entries

entries_done:
  ; Menu background hit region
  LDI r7, 0
  LDI r9, 144
  LDI r13, 120
  LDI r12, 96
  HITSET r7, r9, r13, r12, 5

skip_menu:
  FRAME
  JMP main_loop
