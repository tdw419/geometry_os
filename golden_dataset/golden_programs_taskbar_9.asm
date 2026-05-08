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
LDI r6, 1
LDI r1, 0                 ; zero constant

; Clear state
LDI r20, MENU_OPEN
STORE r20, r1
LDI r20, SCROLL_OFF
STORE r20, r1
LDI r20, SEL_INDEX
STORE r20, r1

; ==========================================
; MAIN LOOP
; ==========================================
main_loop:
  ; -- Draw desktop area (above taskbar) --
  LDI r15, 0x181828
  FILL r15

  ; -- Draw taskbar background --
  LDI r15, 0x2D2D3D        ; dark blue-gray
  LDI r11, 0
  LDI r0, TBAR_Y
  LDI r13, 256
  LDI r3, TBAR_H
  RECTF r11, r0, r13, r3, r15

  ; -- Draw Start button --
  LDI r15, 0x4444AA         ; blue
  LDI r11, 1
  LDI r0, TBAR_Y
  ADDI r0, 1
  LDI r13, 46
  LDI r3, 14
  RECTF r11, r0, r13, r3, r15

  ; Write "Start" to STR_BUF
  LDI r11, STR_BUF
  LDI r15, 83               ; S
  STORE r11, r15
  ADD r11, r6
  LDI r15, 116              ; t
  STORE r11, r15
  ADD r11, r6
  LDI r15, 97               ; a
  STORE r11, r15
  ADD r11, r6
  LDI r15, 114              ; r
  STORE r11, r15
  ADD r11, r6
  LDI r15, 116              ; t
  STORE r11, r15
  ADD r11, r6
  LDI r15, 0                ; null
  STORE r11, r15

  ; Draw Start text
  LDI r11, 8
  LDI r0, TBAR_Y
  ADDI r0, 4
  LDI r13, STR_BUF
  LDI r3, 0xFFFFFF
  LDI r8, 0
  DRAWTEXT r11, r0, r13, r3, r8

  ; -- Get running processes via PROCLS --
  LDI r11, PID_BUF
  PROCLS r11
  ; r15 = process count
  LDI r20, PROC_COUNT
  STORE r20, r15

  ; -- Draw process count on taskbar as "P:N" --
  LDI r11, STR_BUF
  LDI r15, 80               ; P
  STORE r11, r15
  ADD r11, r6
  LDI r15, 58               ; :
  STORE r11, r15
  ADD r11, r6
  ; Convert process count to ASCII digit
  LDI r20, PROC_COUNT
  LOAD r20, r20
  LDI r15, 48               ; 0
  ADD r15, r20
  STORE r11, r15
  ADD r11, r6
  LDI r15, 0
  STORE r11, r15

  LDI r11, 52
  LDI r0, TBAR_Y
  ADDI r0, 4
  LDI r13, STR_BUF
  LDI r3, 0x00FF00
  LDI r8, 0
  DRAWTEXT r11, r0, r13, r3, r8

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
  LDI r15, 48
  ADD r15, r20               ; ASCII digit for minutes
  LDI r11, STR_BUF
  STORE r11, r15
  ADD r11, r6
  LDI r15, 58                ; :
  STORE r11, r15
  ADD r11, r6
  ; seconds
  LDI r20, 0xFFE
  LOAD r20, r20
  LDI r21, 60
  DIV r20, r21              ; total seconds
  LDI r21, 10
  MOD r20, r21              ; seconds mod 10
  LDI r15, 48
  ADD r15, r20
  STORE r11, r15
  ADD r11, r6
  LDI r15, 0
  STORE r11, r15

  LDI r11, 232
  LDI r0, TBAR_Y
  ADDI r0, 4
  LDI r13, STR_BUF
  LDI r3, 0xAAAAFF
  LDI r8, 0
  DRAWTEXT r11, r0, r13, r3, r8

  ; -- Register hit region for Start button --
  LDI r11, 1               ; x
  LDI r0, TBAR_Y
  ADDI r0, 1              ; y
  LDI r13, 46              ; w
  LDI r3, 14              ; h
  HITSET r11, r0, r13, r3, 1

  ; -- Check mouse --
  MOUSEQ r11                ; r11=mx, r0=my, r13=btn

  ; Check for click (btn==2)
  LDI r3, 2
  CMP r13, r3
  BNE_check:
  ; BNE not available -- use JNZ on difference
  MOV r2, r13
  SUB r2, r3              ; r2 = btn - 2
  JNZ r2, no_click

  ; Something was clicked -- check what
  HITQ r8                  ; r8 = hit region id

  ; Start button (id==1)?
  LDI r2, 1
  CMP r8, r2
  JNZ r15, check_menu_click

  ; Toggle menu
  LDI r20, MENU_OPEN
  LOAD r21, r20
  LDI r2, 1
  CMP r21, r2
  JNZ r15, open_menu
  ; Close menu
  LDI r15, 0
  STORE r20, r15
  JMP no_click

open_menu:
  LDI r15, 1
  STORE r20, r15
  ; Refresh file list
  LDI r11, FILE_BUF
  LS r11
  LDI r20, FILE_COUNT
  STORE r20, r15
  LDI r20, SCROLL_OFF
  LDI r15, 0
  STORE r20, r15
  LDI r20, SEL_INDEX
  STORE r20, r15
  JMP no_click

check_menu_click:
  ; Menu item (id >= 10)? If r8 < 10, skip
  LDI r2, 10
  CMP r8, r2
  BLT r15, no_click

  ; Close menu on selection
  LDI r20, MENU_OPEN
  LDI r15, 0
  STORE r20, r15
  JMP no_click

no_click:
  ; -- Draw menu if open --
  LDI r20, MENU_OPEN
  LOAD r20, r20
  LDI r2, 1
  CMP r20, r2
  JNZ r15, skip_menu

  ; Menu background
  LDI r15, 0x303050
  LDI r11, 0
  LDI r0, 144
  LDI r13, 120
  LDI r3, 96
  RECTF r11, r0, r13, r3, r15

  ; Menu border
  LDI r15, 0x6666AA
  LDI r11, 0
  LDI r0, 144
  LDI r13, 120
  LDI r3, 96
  RECT r11, r0, r13, r3, r15

  ; Menu title "Apps"
  LDI r11, STR_BUF
  LDI r15, 65                ; A
  STORE r11, r15
  ADD r11, r6
  LDI r15, 112               ; p
  STORE r11, r15
  ADD r11, r6
  LDI r15, 112               ; p
  STORE r11, r15
  ADD r11, r6
  LDI r15, 115               ; s
  STORE r11, r15
  ADD r11, r6
  LDI r15, 0
  STORE r11, r15
  LDI r11, 4
  LDI r0, 148
  LDI r13, STR_BUF
  LDI r3, 0xFFFFFF
  LDI r8, 0
  DRAWTEXT r11, r0, r13, r3, r8

  ; Draw file list entries (up to 4 visible)
  LDI r22, 0                ; visible entry counter
  LDI r23, 4                ; max visible
  LDI r24, FILE_BUF          ; filename ptr
  LDI r20, FILE_COUNT
  LOAD r20, r20             ; total files

draw_entries:
  CMP r22, r23
  BGE r15, entries_done
  CMP r20, r1
  JZ r15, entries_done

  ; Copy filename to STR_BUF
  LDI r25, STR_BUF
  LDI r26, 12               ; max chars
copy_name:
  LOAD r27, r24
  STORE r25, r27
  JZ r27, name_done
  ADD r24, r6
  ADD r25, r6
  SUBI r26, 1
  JZ r26, name_done
  JMP copy_name

name_done:
  ; Draw filename
  LDI r11, 4
  LDI r0, 164
  MOV r13, r22
  LDI r28, 14
  MUL r13, r28
  ADD r0, r13              ; y = 164 + entry * 14
  LDI r13, STR_BUF
  LDI r3, 0xCCCCFF
  LDI r8, 0
  DRAWTEXT r11, r0, r13, r3, r8

  ; Advance r24 past null
  LOAD r27, r24
  JNZ r27, no_adv
  ADD r24, r6
no_adv:

  ADDI r22, 1
  SUBI r20, 1
  JMP draw_entries

entries_done:
  ; Menu background hit region
  LDI r11, 0
  LDI r0, 144
  LDI r13, 120
  LDI r3, 96
  HITSET r11, r0, r13, r3, 5

skip_menu:
  FRAME
  JMP main_loop
