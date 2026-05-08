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
LDI r7, 1
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
  LDI r3, 0x181828
  FILL r3

  ; -- Draw taskbar background --
  LDI r3, 0x2D2D3D        ; dark blue-gray
  LDI r0, 0
  LDI r14, TBAR_Y
  LDI r15, 256
  LDI r13, TBAR_H
  RECTF r0, r14, r15, r13, r3

  ; -- Draw Start button --
  LDI r3, 0x4444AA         ; blue
  LDI r0, 1
  LDI r14, TBAR_Y
  ADDI r14, 1
  LDI r15, 46
  LDI r13, 14
  RECTF r0, r14, r15, r13, r3

  ; Write "Start" to STR_BUF
  LDI r0, STR_BUF
  LDI r3, 83               ; S
  STORE r0, r3
  ADD r0, r7
  LDI r3, 116              ; t
  STORE r0, r3
  ADD r0, r7
  LDI r3, 97               ; a
  STORE r0, r3
  ADD r0, r7
  LDI r3, 114              ; r
  STORE r0, r3
  ADD r0, r7
  LDI r3, 116              ; t
  STORE r0, r3
  ADD r0, r7
  LDI r3, 0                ; null
  STORE r0, r3

  ; Draw Start text
  LDI r0, 8
  LDI r14, TBAR_Y
  ADDI r14, 4
  LDI r15, STR_BUF
  LDI r13, 0xFFFFFF
  LDI r11, 0
  DRAWTEXT r0, r14, r15, r13, r11

  ; -- Get running processes via PROCLS --
  LDI r0, PID_BUF
  PROCLS r0
  ; r3 = process count
  LDI r20, PROC_COUNT
  STORE r20, r3

  ; -- Draw process count on taskbar as "P:N" --
  LDI r0, STR_BUF
  LDI r3, 80               ; P
  STORE r0, r3
  ADD r0, r7
  LDI r3, 58               ; :
  STORE r0, r3
  ADD r0, r7
  ; Convert process count to ASCII digit
  LDI r20, PROC_COUNT
  LOAD r20, r20
  LDI r3, 48               ; 0
  ADD r3, r20
  STORE r0, r3
  ADD r0, r7
  LDI r3, 0
  STORE r0, r3

  LDI r0, 52
  LDI r14, TBAR_Y
  ADDI r14, 4
  LDI r15, STR_BUF
  LDI r13, 0x00FF00
  LDI r11, 0
  DRAWTEXT r0, r14, r15, r13, r11

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
  LDI r3, 48
  ADD r3, r20               ; ASCII digit for minutes
  LDI r0, STR_BUF
  STORE r0, r3
  ADD r0, r7
  LDI r3, 58                ; :
  STORE r0, r3
  ADD r0, r7
  ; seconds
  LDI r20, 0xFFE
  LOAD r20, r20
  LDI r21, 60
  DIV r20, r21              ; total seconds
  LDI r21, 10
  MOD r20, r21              ; seconds mod 10
  LDI r3, 48
  ADD r3, r20
  STORE r0, r3
  ADD r0, r7
  LDI r3, 0
  STORE r0, r3

  LDI r0, 232
  LDI r14, TBAR_Y
  ADDI r14, 4
  LDI r15, STR_BUF
  LDI r13, 0xAAAAFF
  LDI r11, 0
  DRAWTEXT r0, r14, r15, r13, r11

  ; -- Register hit region for Start button --
  LDI r0, 1               ; x
  LDI r14, TBAR_Y
  ADDI r14, 1              ; y
  LDI r15, 46              ; w
  LDI r13, 14              ; h
  HITSET r0, r14, r15, r13, 1

  ; -- Check mouse --
  MOUSEQ r0                ; r0=mx, r14=my, r15=btn

  ; Check for click (btn==2)
  LDI r13, 2
  CMP r15, r13
  BNE_check:
  ; BNE not available -- use JNZ on difference
  MOV r6, r15
  SUB r6, r13              ; r6 = btn - 2
  JNZ r6, no_click

  ; Something was clicked -- check what
  HITQ r11                  ; r11 = hit region id

  ; Start button (id==1)?
  LDI r6, 1
  CMP r11, r6
  JNZ r3, check_menu_click

  ; Toggle menu
  LDI r20, MENU_OPEN
  LOAD r21, r20
  LDI r6, 1
  CMP r21, r6
  JNZ r3, open_menu
  ; Close menu
  LDI r3, 0
  STORE r20, r3
  JMP no_click

open_menu:
  LDI r3, 1
  STORE r20, r3
  ; Refresh file list
  LDI r0, FILE_BUF
  LS r0
  LDI r20, FILE_COUNT
  STORE r20, r3
  LDI r20, SCROLL_OFF
  LDI r3, 0
  STORE r20, r3
  LDI r20, SEL_INDEX
  STORE r20, r3
  JMP no_click

check_menu_click:
  ; Menu item (id >= 10)? If r11 < 10, skip
  LDI r6, 10
  CMP r11, r6
  BLT r3, no_click

  ; Close menu on selection
  LDI r20, MENU_OPEN
  LDI r3, 0
  STORE r20, r3
  JMP no_click

no_click:
  ; -- Draw menu if open --
  LDI r20, MENU_OPEN
  LOAD r20, r20
  LDI r6, 1
  CMP r20, r6
  JNZ r3, skip_menu

  ; Menu background
  LDI r3, 0x303050
  LDI r0, 0
  LDI r14, 144
  LDI r15, 120
  LDI r13, 96
  RECTF r0, r14, r15, r13, r3

  ; Menu border
  LDI r3, 0x6666AA
  LDI r0, 0
  LDI r14, 144
  LDI r15, 120
  LDI r13, 96
  RECT r0, r14, r15, r13, r3

  ; Menu title "Apps"
  LDI r0, STR_BUF
  LDI r3, 65                ; A
  STORE r0, r3
  ADD r0, r7
  LDI r3, 112               ; p
  STORE r0, r3
  ADD r0, r7
  LDI r3, 112               ; p
  STORE r0, r3
  ADD r0, r7
  LDI r3, 115               ; s
  STORE r0, r3
  ADD r0, r7
  LDI r3, 0
  STORE r0, r3
  LDI r0, 4
  LDI r14, 148
  LDI r15, STR_BUF
  LDI r13, 0xFFFFFF
  LDI r11, 0
  DRAWTEXT r0, r14, r15, r13, r11

  ; Draw file list entries (up to 4 visible)
  LDI r22, 0                ; visible entry counter
  LDI r23, 4                ; max visible
  LDI r24, FILE_BUF          ; filename ptr
  LDI r20, FILE_COUNT
  LOAD r20, r20             ; total files

draw_entries:
  CMP r22, r23
  BGE r3, entries_done
  CMP r20, r4
  JZ r3, entries_done

  ; Copy filename to STR_BUF
  LDI r25, STR_BUF
  LDI r26, 12               ; max chars
copy_name:
  LOAD r27, r24
  STORE r25, r27
  JZ r27, name_done
  ADD r24, r7
  ADD r25, r7
  SUBI r26, 1
  JZ r26, name_done
  JMP copy_name

name_done:
  ; Draw filename
  LDI r0, 4
  LDI r14, 164
  MOV r15, r22
  LDI r28, 14
  MUL r15, r28
  ADD r14, r15              ; y = 164 + entry * 14
  LDI r15, STR_BUF
  LDI r13, 0xCCCCFF
  LDI r11, 0
  DRAWTEXT r0, r14, r15, r13, r11

  ; Advance r24 past null
  LOAD r27, r24
  JNZ r27, no_adv
  ADD r24, r7
no_adv:

  ADDI r22, 1
  SUBI r20, 1
  JMP draw_entries

entries_done:
  ; Menu background hit region
  LDI r0, 0
  LDI r14, 144
  LDI r15, 120
  LDI r13, 96
  HITSET r0, r14, r15, r13, 5

skip_menu:
  FRAME
  JMP main_loop
