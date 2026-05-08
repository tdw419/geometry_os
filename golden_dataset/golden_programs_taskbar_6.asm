; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
LDI r0, 1
LDI r11, 0                 ; zero constant

; Clear state
LDI r20, MENU_OPEN
STORE r20, r11
LDI r20, SCROLL_OFF
STORE r20, r11
LDI r20, SEL_INDEX
STORE r20, r11

; ==========================================
; MAIN LOOP
; ==========================================
main_loop:
  ; -- Draw desktop area (above taskbar) --
  LDI r12, 0x181828
  FILL r12

  ; -- Draw taskbar background --
  LDI r12, 0x2D2D3D        ; dark blue-gray
  LDI r1, 0
  LDI r3, TBAR_Y
  LDI r5, 256
  LDI r9, TBAR_H
  RECTF r1, r3, r5, r9, r12

  ; -- Draw Start button --
  LDI r12, 0x4444AA         ; blue
  LDI r1, 1
  LDI r3, TBAR_Y
  ADDI r3, 1
  LDI r5, 46
  LDI r9, 14
  RECTF r1, r3, r5, r9, r12

  ; Write "Start" to STR_BUF
  LDI r1, STR_BUF
  LDI r12, 83               ; S
  STORE r1, r12
  ADD r1, r0
  LDI r12, 116              ; t
  STORE r1, r12
  ADD r1, r0
  LDI r12, 97               ; a
  STORE r1, r12
  ADD r1, r0
  LDI r12, 114              ; r
  STORE r1, r12
  ADD r1, r0
  LDI r12, 116              ; t
  STORE r1, r12
  ADD r1, r0
  LDI r12, 0                ; null
  STORE r1, r12

  ; Draw Start text
  LDI r1, 8
  LDI r3, TBAR_Y
  ADDI r3, 4
  LDI r5, STR_BUF
  LDI r9, 0xFFFFFF
  LDI r15, 0
  DRAWTEXT r1, r3, r5, r9, r15

  ; -- Get running processes via PROCLS --
  LDI r1, PID_BUF
  PROCLS r1
  ; r12 = process count
  LDI r20, PROC_COUNT
  STORE r20, r12

  ; -- Draw process count on taskbar as "P:N" --
  LDI r1, STR_BUF
  LDI r12, 80               ; P
  STORE r1, r12
  ADD r1, r0
  LDI r12, 58               ; :
  STORE r1, r12
  ADD r1, r0
  ; Convert process count to ASCII digit
  LDI r20, PROC_COUNT
  LOAD r20, r20
  LDI r12, 48               ; 0
  ADD r12, r20
  STORE r1, r12
  ADD r1, r0
  LDI r12, 0
  STORE r1, r12

  LDI r1, 52
  LDI r3, TBAR_Y
  ADDI r3, 4
  LDI r5, STR_BUF
  LDI r9, 0x00FF00
  LDI r15, 0
  DRAWTEXT r1, r3, r5, r9, r15

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
  LDI r12, 48
  ADD r12, r20               ; ASCII digit for minutes
  LDI r1, STR_BUF
  STORE r1, r12
  ADD r1, r0
  LDI r12, 58                ; :
  STORE r1, r12
  ADD r1, r0
  ; seconds
  LDI r20, 0xFFE
  LOAD r20, r20
  LDI r21, 60
  DIV r20, r21              ; total seconds
  LDI r21, 10
  MOD r20, r21              ; seconds mod 10
  LDI r12, 48
  ADD r12, r20
  STORE r1, r12
  ADD r1, r0
  LDI r12, 0
  STORE r1, r12

  LDI r1, 232
  LDI r3, TBAR_Y
  ADDI r3, 4
  LDI r5, STR_BUF
  LDI r9, 0xAAAAFF
  LDI r15, 0
  DRAWTEXT r1, r3, r5, r9, r15

  ; -- Register hit region for Start button --
  LDI r1, 1               ; x
  LDI r3, TBAR_Y
  ADDI r3, 1              ; y
  LDI r5, 46              ; w
  LDI r9, 14              ; h
  HITSET r1, r3, r5, r9, 1

  ; -- Check mouse --
  MOUSEQ r1                ; r1=mx, r3=my, r5=btn

  ; Check for click (btn==2)
  LDI r9, 2
  CMP r5, r9
  BNE_check:
  ; BNE not available -- use JNZ on difference
  MOV r4, r5
  SUB r4, r9              ; r4 = btn - 2
  JNZ r4, no_click

  ; Something was clicked -- check what
  HITQ r15                  ; r15 = hit region id

  ; Start button (id==1)?
  LDI r4, 1
  CMP r15, r4
  JNZ r12, check_menu_click

  ; Toggle menu
  LDI r20, MENU_OPEN
  LOAD r21, r20
  LDI r4, 1
  CMP r21, r4
  JNZ r12, open_menu
  ; Close menu
  LDI r12, 0
  STORE r20, r12
  JMP no_click

open_menu:
  LDI r12, 1
  STORE r20, r12
  ; Refresh file list
  LDI r1, FILE_BUF
  LS r1
  LDI r20, FILE_COUNT
  STORE r20, r12
  LDI r20, SCROLL_OFF
  LDI r12, 0
  STORE r20, r12
  LDI r20, SEL_INDEX
  STORE r20, r12
  JMP no_click

check_menu_click:
  ; Menu item (id >= 10)? If r15 < 10, skip
  LDI r4, 10
  CMP r15, r4
  BLT r12, no_click

  ; Close menu on selection
  LDI r20, MENU_OPEN
  LDI r12, 0
  STORE r20, r12
  JMP no_click

no_click:
  ; -- Draw menu if open --
  LDI r20, MENU_OPEN
  LOAD r20, r20
  LDI r4, 1
  CMP r20, r4
  JNZ r12, skip_menu

  ; Menu background
  LDI r12, 0x303050
  LDI r1, 0
  LDI r3, 144
  LDI r5, 120
  LDI r9, 96
  RECTF r1, r3, r5, r9, r12

  ; Menu border
  LDI r12, 0x6666AA
  LDI r1, 0
  LDI r3, 144
  LDI r5, 120
  LDI r9, 96
  RECT r1, r3, r5, r9, r12

  ; Menu title "Apps"
  LDI r1, STR_BUF
  LDI r12, 65                ; A
  STORE r1, r12
  ADD r1, r0
  LDI r12, 112               ; p
  STORE r1, r12
  ADD r1, r0
  LDI r12, 112               ; p
  STORE r1, r12
  ADD r1, r0
  LDI r12, 115               ; s
  STORE r1, r12
  ADD r1, r0
  LDI r12, 0
  STORE r1, r12
  LDI r1, 4
  LDI r3, 148
  LDI r5, STR_BUF
  LDI r9, 0xFFFFFF
  LDI r15, 0
  DRAWTEXT r1, r3, r5, r9, r15

  ; Draw file list entries (up to 4 visible)
  LDI r22, 0                ; visible entry counter
  LDI r23, 4                ; max visible
  LDI r24, FILE_BUF          ; filename ptr
  LDI r20, FILE_COUNT
  LOAD r20, r20             ; total files

draw_entries:
  CMP r22, r23
  BGE r12, entries_done
  CMP r20, r11
  JZ r12, entries_done

  ; Copy filename to STR_BUF
  LDI r25, STR_BUF
  LDI r26, 12               ; max chars
copy_name:
  LOAD r27, r24
  STORE r25, r27
  JZ r27, name_done
  ADD r24, r0
  ADD r25, r0
  SUBI r26, 1
  JZ r26, name_done
  JMP copy_name

name_done:
  ; Draw filename
  LDI r1, 4
  LDI r3, 164
  MOV r5, r22
  LDI r28, 14
  MUL r5, r28
  ADD r3, r5              ; y = 164 + entry * 14
  LDI r5, STR_BUF
  LDI r9, 0xCCCCFF
  LDI r15, 0
  DRAWTEXT r1, r3, r5, r9, r15

  ; Advance r24 past null
  LOAD r27, r24
  JNZ r27, no_adv
  ADD r24, r0
no_adv:

  ADDI r22, 1
  SUBI r20, 1
  JMP draw_entries

entries_done:
  ; Menu background hit region
  LDI r1, 0
  LDI r3, 144
  LDI r5, 120
  LDI r9, 96
  HITSET r1, r3, r5, r9, 5

skip_menu:
  FRAME
  JMP main_loop
