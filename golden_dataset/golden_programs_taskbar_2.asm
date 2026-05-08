; DESCRIPTION: A colored object centered at the screen with fixed size.

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
LDI r12, 1
LDI r0, 0                 ; zero constant

; Clear state
LDI r20, MENU_OPEN
STORE r20, r0
LDI r20, SCROLL_OFF
STORE r20, r0
LDI r20, SEL_INDEX
STORE r20, r0

; ==========================================
; MAIN LOOP
; ==========================================
main_loop:
  ; -- Draw desktop area (above taskbar) --
  LDI r1, 0x181828
  FILL r1

  ; -- Draw taskbar background --
  LDI r1, 0x2D2D3D        ; dark blue-gray
  LDI r5, 0
  LDI r7, TBAR_Y
  LDI r6, 256
  LDI r2, TBAR_H
  RECTF r5, r7, r6, r2, r1

  ; -- Draw Start button --
  LDI r1, 0x4444AA         ; blue
  LDI r5, 1
  LDI r7, TBAR_Y
  ADDI r7, 1
  LDI r6, 46
  LDI r2, 14
  RECTF r5, r7, r6, r2, r1

  ; Write "Start" to STR_BUF
  LDI r5, STR_BUF
  LDI r1, 83               ; S
  STORE r5, r1
  ADD r5, r12
  LDI r1, 116              ; t
  STORE r5, r1
  ADD r5, r12
  LDI r1, 97               ; a
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114              ; r
  STORE r5, r1
  ADD r5, r12
  LDI r1, 116              ; t
  STORE r5, r1
  ADD r5, r12
  LDI r1, 0                ; null
  STORE r5, r1

  ; Draw Start text
  LDI r5, 8
  LDI r7, TBAR_Y
  ADDI r7, 4
  LDI r6, STR_BUF
  LDI r2, 0xFFFFFF
  LDI r4, 0
  DRAWTEXT r5, r7, r6, r2, r4

  ; -- Get running processes via PROCLS --
  LDI r5, PID_BUF
  PROCLS r5
  ; r1 = process count
  LDI r20, PROC_COUNT
  STORE r20, r1

  ; -- Draw process count on taskbar as "P:N" --
  LDI r5, STR_BUF
  LDI r1, 80               ; P
  STORE r5, r1
  ADD r5, r12
  LDI r1, 58               ; :
  STORE r5, r1
  ADD r5, r12
  ; Convert process count to ASCII digit
  LDI r20, PROC_COUNT
  LOAD r20, r20
  LDI r1, 48               ; 0
  ADD r1, r20
  STORE r5, r1
  ADD r5, r12
  LDI r1, 0
  STORE r5, r1

  LDI r5, 52
  LDI r7, TBAR_Y
  ADDI r7, 4
  LDI r6, STR_BUF
  LDI r2, 0x00FF00
  LDI r4, 0
  DRAWTEXT r5, r7, r6, r2, r4

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
  LDI r1, 48
  ADD r1, r20               ; ASCII digit for minutes
  LDI r5, STR_BUF
  STORE r5, r1
  ADD r5, r12
  LDI r1, 58                ; :
  STORE r5, r1
  ADD r5, r12
  ; seconds
  LDI r20, 0xFFE
  LOAD r20, r20
  LDI r21, 60
  DIV r20, r21              ; total seconds
  LDI r21, 10
  MOD r20, r21              ; seconds mod 10
  LDI r1, 48
  ADD r1, r20
  STORE r5, r1
  ADD r5, r12
  LDI r1, 0
  STORE r5, r1

  LDI r5, 232
  LDI r7, TBAR_Y
  ADDI r7, 4
  LDI r6, STR_BUF
  LDI r2, 0xAAAAFF
  LDI r4, 0
  DRAWTEXT r5, r7, r6, r2, r4

  ; -- Register hit region for Start button --
  LDI r5, 1               ; x
  LDI r7, TBAR_Y
  ADDI r7, 1              ; y
  LDI r6, 46              ; w
  LDI r2, 14              ; h
  HITSET r5, r7, r6, r2, 1

  ; -- Check mouse --
  MOUSEQ r5                ; r5=mx, r7=my, r6=btn

  ; Check for click (btn==2)
  LDI r2, 2
  CMP r6, r2
  BNE_check:
  ; BNE not available -- use JNZ on difference
  MOV r3, r6
  SUB r3, r2              ; r3 = btn - 2
  JNZ r3, no_click

  ; Something was clicked -- check what
  HITQ r4                  ; r4 = hit region id

  ; Start button (id==1)?
  LDI r3, 1
  CMP r4, r3
  JNZ r1, check_menu_click

  ; Toggle menu
  LDI r20, MENU_OPEN
  LOAD r21, r20
  LDI r3, 1
  CMP r21, r3
  JNZ r1, open_menu
  ; Close menu
  LDI r1, 0
  STORE r20, r1
  JMP no_click

open_menu:
  LDI r1, 1
  STORE r20, r1
  ; Refresh file list
  LDI r5, FILE_BUF
  LS r5
  LDI r20, FILE_COUNT
  STORE r20, r1
  LDI r20, SCROLL_OFF
  LDI r1, 0
  STORE r20, r1
  LDI r20, SEL_INDEX
  STORE r20, r1
  JMP no_click

check_menu_click:
  ; Menu item (id >= 10)? If r4 < 10, skip
  LDI r3, 10
  CMP r4, r3
  BLT r1, no_click

  ; Close menu on selection
  LDI r20, MENU_OPEN
  LDI r1, 0
  STORE r20, r1
  JMP no_click

no_click:
  ; -- Draw menu if open --
  LDI r20, MENU_OPEN
  LOAD r20, r20
  LDI r3, 1
  CMP r20, r3
  JNZ r1, skip_menu

  ; Menu background
  LDI r1, 0x303050
  LDI r5, 0
  LDI r7, 144
  LDI r6, 120
  LDI r2, 96
  RECTF r5, r7, r6, r2, r1

  ; Menu border
  LDI r1, 0x6666AA
  LDI r5, 0
  LDI r7, 144
  LDI r6, 120
  LDI r2, 96
  RECT r5, r7, r6, r2, r1

  ; Menu title "Apps"
  LDI r5, STR_BUF
  LDI r1, 65                ; A
  STORE r5, r1
  ADD r5, r12
  LDI r1, 112               ; p
  STORE r5, r1
  ADD r5, r12
  LDI r1, 112               ; p
  STORE r5, r1
  ADD r5, r12
  LDI r1, 115               ; s
  STORE r5, r1
  ADD r5, r12
  LDI r1, 0
  STORE r5, r1
  LDI r5, 4
  LDI r7, 148
  LDI r6, STR_BUF
  LDI r2, 0xFFFFFF
  LDI r4, 0
  DRAWTEXT r5, r7, r6, r2, r4

  ; Draw file list entries (up to 4 visible)
  LDI r22, 0                ; visible entry counter
  LDI r23, 4                ; max visible
  LDI r24, FILE_BUF          ; filename ptr
  LDI r20, FILE_COUNT
  LOAD r20, r20             ; total files

draw_entries:
  CMP r22, r23
  BGE r1, entries_done
  CMP r20, r0
  JZ r1, entries_done

  ; Copy filename to STR_BUF
  LDI r25, STR_BUF
  LDI r26, 12               ; max chars
copy_name:
  LOAD r27, r24
  STORE r25, r27
  JZ r27, name_done
  ADD r24, r12
  ADD r25, r12
  SUBI r26, 1
  JZ r26, name_done
  JMP copy_name

name_done:
  ; Draw filename
  LDI r5, 4
  LDI r7, 164
  MOV r6, r22
  LDI r28, 14
  MUL r6, r28
  ADD r7, r6              ; y = 164 + entry * 14
  LDI r6, STR_BUF
  LDI r2, 0xCCCCFF
  LDI r4, 0
  DRAWTEXT r5, r7, r6, r2, r4

  ; Advance r24 past null
  LOAD r27, r24
  JNZ r27, no_adv
  ADD r24, r12
no_adv:

  ADDI r22, 1
  SUBI r20, 1
  JMP draw_entries

entries_done:
  ; Menu background hit region
  LDI r5, 0
  LDI r7, 144
  LDI r6, 120
  LDI r2, 96
  HITSET r5, r7, r6, r2, 5

skip_menu:
  FRAME
  JMP main_loop
