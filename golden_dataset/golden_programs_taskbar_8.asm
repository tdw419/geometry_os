; DESCRIPTION: Geometry OS program to draw a colored object.

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
LDI r5, 1
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
  LDI r11, 0x181828
  FILL r11

  ; -- Draw taskbar background --
  LDI r11, 0x2D2D3D        ; dark blue-gray
  LDI r6, 0
  LDI r13, TBAR_Y
  LDI r2, 256
  LDI r3, TBAR_H
  RECTF r6, r13, r2, r3, r11

  ; -- Draw Start button --
  LDI r11, 0x4444AA         ; blue
  LDI r6, 1
  LDI r13, TBAR_Y
  ADDI r13, 1
  LDI r2, 46
  LDI r3, 14
  RECTF r6, r13, r2, r3, r11

  ; Write "Start" to STR_BUF
  LDI r6, STR_BUF
  LDI r11, 83               ; S
  STORE r6, r11
  ADD r6, r5
  LDI r11, 116              ; t
  STORE r6, r11
  ADD r6, r5
  LDI r11, 97               ; a
  STORE r6, r11
  ADD r6, r5
  LDI r11, 114              ; r
  STORE r6, r11
  ADD r6, r5
  LDI r11, 116              ; t
  STORE r6, r11
  ADD r6, r5
  LDI r11, 0                ; null
  STORE r6, r11

  ; Draw Start text
  LDI r6, 8
  LDI r13, TBAR_Y
  ADDI r13, 4
  LDI r2, STR_BUF
  LDI r3, 0xFFFFFF
  LDI r12, 0
  DRAWTEXT r6, r13, r2, r3, r12

  ; -- Get running processes via PROCLS --
  LDI r6, PID_BUF
  PROCLS r6
  ; r11 = process count
  LDI r20, PROC_COUNT
  STORE r20, r11

  ; -- Draw process count on taskbar as "P:N" --
  LDI r6, STR_BUF
  LDI r11, 80               ; P
  STORE r6, r11
  ADD r6, r5
  LDI r11, 58               ; :
  STORE r6, r11
  ADD r6, r5
  ; Convert process count to ASCII digit
  LDI r20, PROC_COUNT
  LOAD r20, r20
  LDI r11, 48               ; 0
  ADD r11, r20
  STORE r6, r11
  ADD r6, r5
  LDI r11, 0
  STORE r6, r11

  LDI r6, 52
  LDI r13, TBAR_Y
  ADDI r13, 4
  LDI r2, STR_BUF
  LDI r3, 0x00FF00
  LDI r12, 0
  DRAWTEXT r6, r13, r2, r3, r12

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
  LDI r11, 48
  ADD r11, r20               ; ASCII digit for minutes
  LDI r6, STR_BUF
  STORE r6, r11
  ADD r6, r5
  LDI r11, 58                ; :
  STORE r6, r11
  ADD r6, r5
  ; seconds
  LDI r20, 0xFFE
  LOAD r20, r20
  LDI r21, 60
  DIV r20, r21              ; total seconds
  LDI r21, 10
  MOD r20, r21              ; seconds mod 10
  LDI r11, 48
  ADD r11, r20
  STORE r6, r11
  ADD r6, r5
  LDI r11, 0
  STORE r6, r11

  LDI r6, 232
  LDI r13, TBAR_Y
  ADDI r13, 4
  LDI r2, STR_BUF
  LDI r3, 0xAAAAFF
  LDI r12, 0
  DRAWTEXT r6, r13, r2, r3, r12

  ; -- Register hit region for Start button --
  LDI r6, 1               ; x
  LDI r13, TBAR_Y
  ADDI r13, 1              ; y
  LDI r2, 46              ; w
  LDI r3, 14              ; h
  HITSET r6, r13, r2, r3, 1

  ; -- Check mouse --
  MOUSEQ r6                ; r6=mx, r13=my, r2=btn

  ; Check for click (btn==2)
  LDI r3, 2
  CMP r2, r3
  BNE_check:
  ; BNE not available -- use JNZ on difference
  MOV r8, r2
  SUB r8, r3              ; r8 = btn - 2
  JNZ r8, no_click

  ; Something was clicked -- check what
  HITQ r12                  ; r12 = hit region id

  ; Start button (id==1)?
  LDI r8, 1
  CMP r12, r8
  JNZ r11, check_menu_click

  ; Toggle menu
  LDI r20, MENU_OPEN
  LOAD r21, r20
  LDI r8, 1
  CMP r21, r8
  JNZ r11, open_menu
  ; Close menu
  LDI r11, 0
  STORE r20, r11
  JMP no_click

open_menu:
  LDI r11, 1
  STORE r20, r11
  ; Refresh file list
  LDI r6, FILE_BUF
  LS r6
  LDI r20, FILE_COUNT
  STORE r20, r11
  LDI r20, SCROLL_OFF
  LDI r11, 0
  STORE r20, r11
  LDI r20, SEL_INDEX
  STORE r20, r11
  JMP no_click

check_menu_click:
  ; Menu item (id >= 10)? If r12 < 10, skip
  LDI r8, 10
  CMP r12, r8
  BLT r11, no_click

  ; Close menu on selection
  LDI r20, MENU_OPEN
  LDI r11, 0
  STORE r20, r11
  JMP no_click

no_click:
  ; -- Draw menu if open --
  LDI r20, MENU_OPEN
  LOAD r20, r20
  LDI r8, 1
  CMP r20, r8
  JNZ r11, skip_menu

  ; Menu background
  LDI r11, 0x303050
  LDI r6, 0
  LDI r13, 144
  LDI r2, 120
  LDI r3, 96
  RECTF r6, r13, r2, r3, r11

  ; Menu border
  LDI r11, 0x6666AA
  LDI r6, 0
  LDI r13, 144
  LDI r2, 120
  LDI r3, 96
  RECT r6, r13, r2, r3, r11

  ; Menu title "Apps"
  LDI r6, STR_BUF
  LDI r11, 65                ; A
  STORE r6, r11
  ADD r6, r5
  LDI r11, 112               ; p
  STORE r6, r11
  ADD r6, r5
  LDI r11, 112               ; p
  STORE r6, r11
  ADD r6, r5
  LDI r11, 115               ; s
  STORE r6, r11
  ADD r6, r5
  LDI r11, 0
  STORE r6, r11
  LDI r6, 4
  LDI r13, 148
  LDI r2, STR_BUF
  LDI r3, 0xFFFFFF
  LDI r12, 0
  DRAWTEXT r6, r13, r2, r3, r12

  ; Draw file list entries (up to 4 visible)
  LDI r22, 0                ; visible entry counter
  LDI r23, 4                ; max visible
  LDI r24, FILE_BUF          ; filename ptr
  LDI r20, FILE_COUNT
  LOAD r20, r20             ; total files

draw_entries:
  CMP r22, r23
  BGE r11, entries_done
  CMP r20, r4
  JZ r11, entries_done

  ; Copy filename to STR_BUF
  LDI r25, STR_BUF
  LDI r26, 12               ; max chars
copy_name:
  LOAD r27, r24
  STORE r25, r27
  JZ r27, name_done
  ADD r24, r5
  ADD r25, r5
  SUBI r26, 1
  JZ r26, name_done
  JMP copy_name

name_done:
  ; Draw filename
  LDI r6, 4
  LDI r13, 164
  MOV r2, r22
  LDI r28, 14
  MUL r2, r28
  ADD r13, r2              ; y = 164 + entry * 14
  LDI r2, STR_BUF
  LDI r3, 0xCCCCFF
  LDI r12, 0
  DRAWTEXT r6, r13, r2, r3, r12

  ; Advance r24 past null
  LOAD r27, r24
  JNZ r27, no_adv
  ADD r24, r5
no_adv:

  ADDI r22, 1
  SUBI r20, 1
  JMP draw_entries

entries_done:
  ; Menu background hit region
  LDI r6, 0
  LDI r13, 144
  LDI r2, 120
  LDI r3, 96
  HITSET r6, r13, r2, r3, 5

skip_menu:
  FRAME
  JMP main_loop
