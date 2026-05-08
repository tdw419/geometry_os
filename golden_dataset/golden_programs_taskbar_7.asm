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
LDI r2, 1
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
  LDI r10, 0x181828
  FILL r10

  ; -- Draw taskbar background --
  LDI r10, 0x2D2D3D        ; dark blue-gray
  LDI r8, 0
  LDI r15, TBAR_Y
  LDI r6, 256
  LDI r0, TBAR_H
  RECTF r8, r15, r6, r0, r10

  ; -- Draw Start button --
  LDI r10, 0x4444AA         ; blue
  LDI r8, 1
  LDI r15, TBAR_Y
  ADDI r15, 1
  LDI r6, 46
  LDI r0, 14
  RECTF r8, r15, r6, r0, r10

  ; Write "Start" to STR_BUF
  LDI r8, STR_BUF
  LDI r10, 83               ; S
  STORE r8, r10
  ADD r8, r2
  LDI r10, 116              ; t
  STORE r8, r10
  ADD r8, r2
  LDI r10, 97               ; a
  STORE r8, r10
  ADD r8, r2
  LDI r10, 114              ; r
  STORE r8, r10
  ADD r8, r2
  LDI r10, 116              ; t
  STORE r8, r10
  ADD r8, r2
  LDI r10, 0                ; null
  STORE r8, r10

  ; Draw Start text
  LDI r8, 8
  LDI r15, TBAR_Y
  ADDI r15, 4
  LDI r6, STR_BUF
  LDI r0, 0xFFFFFF
  LDI r7, 0
  DRAWTEXT r8, r15, r6, r0, r7

  ; -- Get running processes via PROCLS --
  LDI r8, PID_BUF
  PROCLS r8
  ; r10 = process count
  LDI r20, PROC_COUNT
  STORE r20, r10

  ; -- Draw process count on taskbar as "P:N" --
  LDI r8, STR_BUF
  LDI r10, 80               ; P
  STORE r8, r10
  ADD r8, r2
  LDI r10, 58               ; :
  STORE r8, r10
  ADD r8, r2
  ; Convert process count to ASCII digit
  LDI r20, PROC_COUNT
  LOAD r20, r20
  LDI r10, 48               ; 0
  ADD r10, r20
  STORE r8, r10
  ADD r8, r2
  LDI r10, 0
  STORE r8, r10

  LDI r8, 52
  LDI r15, TBAR_Y
  ADDI r15, 4
  LDI r6, STR_BUF
  LDI r0, 0x00FF00
  LDI r7, 0
  DRAWTEXT r8, r15, r6, r0, r7

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
  LDI r10, 48
  ADD r10, r20               ; ASCII digit for minutes
  LDI r8, STR_BUF
  STORE r8, r10
  ADD r8, r2
  LDI r10, 58                ; :
  STORE r8, r10
  ADD r8, r2
  ; seconds
  LDI r20, 0xFFE
  LOAD r20, r20
  LDI r21, 60
  DIV r20, r21              ; total seconds
  LDI r21, 10
  MOD r20, r21              ; seconds mod 10
  LDI r10, 48
  ADD r10, r20
  STORE r8, r10
  ADD r8, r2
  LDI r10, 0
  STORE r8, r10

  LDI r8, 232
  LDI r15, TBAR_Y
  ADDI r15, 4
  LDI r6, STR_BUF
  LDI r0, 0xAAAAFF
  LDI r7, 0
  DRAWTEXT r8, r15, r6, r0, r7

  ; -- Register hit region for Start button --
  LDI r8, 1               ; x
  LDI r15, TBAR_Y
  ADDI r15, 1              ; y
  LDI r6, 46              ; w
  LDI r0, 14              ; h
  HITSET r8, r15, r6, r0, 1

  ; -- Check mouse --
  MOUSEQ r8                ; r8=mx, r15=my, r6=btn

  ; Check for click (btn==2)
  LDI r0, 2
  CMP r6, r0
  BNE_check:
  ; BNE not available -- use JNZ on difference
  MOV r14, r6
  SUB r14, r0              ; r14 = btn - 2
  JNZ r14, no_click

  ; Something was clicked -- check what
  HITQ r7                  ; r7 = hit region id

  ; Start button (id==1)?
  LDI r14, 1
  CMP r7, r14
  JNZ r10, check_menu_click

  ; Toggle menu
  LDI r20, MENU_OPEN
  LOAD r21, r20
  LDI r14, 1
  CMP r21, r14
  JNZ r10, open_menu
  ; Close menu
  LDI r10, 0
  STORE r20, r10
  JMP no_click

open_menu:
  LDI r10, 1
  STORE r20, r10
  ; Refresh file list
  LDI r8, FILE_BUF
  LS r8
  LDI r20, FILE_COUNT
  STORE r20, r10
  LDI r20, SCROLL_OFF
  LDI r10, 0
  STORE r20, r10
  LDI r20, SEL_INDEX
  STORE r20, r10
  JMP no_click

check_menu_click:
  ; Menu item (id >= 10)? If r7 < 10, skip
  LDI r14, 10
  CMP r7, r14
  BLT r10, no_click

  ; Close menu on selection
  LDI r20, MENU_OPEN
  LDI r10, 0
  STORE r20, r10
  JMP no_click

no_click:
  ; -- Draw menu if open --
  LDI r20, MENU_OPEN
  LOAD r20, r20
  LDI r14, 1
  CMP r20, r14
  JNZ r10, skip_menu

  ; Menu background
  LDI r10, 0x303050
  LDI r8, 0
  LDI r15, 144
  LDI r6, 120
  LDI r0, 96
  RECTF r8, r15, r6, r0, r10

  ; Menu border
  LDI r10, 0x6666AA
  LDI r8, 0
  LDI r15, 144
  LDI r6, 120
  LDI r0, 96
  RECT r8, r15, r6, r0, r10

  ; Menu title "Apps"
  LDI r8, STR_BUF
  LDI r10, 65                ; A
  STORE r8, r10
  ADD r8, r2
  LDI r10, 112               ; p
  STORE r8, r10
  ADD r8, r2
  LDI r10, 112               ; p
  STORE r8, r10
  ADD r8, r2
  LDI r10, 115               ; s
  STORE r8, r10
  ADD r8, r2
  LDI r10, 0
  STORE r8, r10
  LDI r8, 4
  LDI r15, 148
  LDI r6, STR_BUF
  LDI r0, 0xFFFFFF
  LDI r7, 0
  DRAWTEXT r8, r15, r6, r0, r7

  ; Draw file list entries (up to 4 visible)
  LDI r22, 0                ; visible entry counter
  LDI r23, 4                ; max visible
  LDI r24, FILE_BUF          ; filename ptr
  LDI r20, FILE_COUNT
  LOAD r20, r20             ; total files

draw_entries:
  CMP r22, r23
  BGE r10, entries_done
  CMP r20, r1
  JZ r10, entries_done

  ; Copy filename to STR_BUF
  LDI r25, STR_BUF
  LDI r26, 12               ; max chars
copy_name:
  LOAD r27, r24
  STORE r25, r27
  JZ r27, name_done
  ADD r24, r2
  ADD r25, r2
  SUBI r26, 1
  JZ r26, name_done
  JMP copy_name

name_done:
  ; Draw filename
  LDI r8, 4
  LDI r15, 164
  MOV r6, r22
  LDI r28, 14
  MUL r6, r28
  ADD r15, r6              ; y = 164 + entry * 14
  LDI r6, STR_BUF
  LDI r0, 0xCCCCFF
  LDI r7, 0
  DRAWTEXT r8, r15, r6, r0, r7

  ; Advance r24 past null
  LOAD r27, r24
  JNZ r27, no_adv
  ADD r24, r2
no_adv:

  ADDI r22, 1
  SUBI r20, 1
  JMP draw_entries

entries_done:
  ; Menu background hit region
  LDI r8, 0
  LDI r15, 144
  LDI r6, 120
  LDI r0, 96
  HITSET r8, r15, r6, r0, 5

skip_menu:
  FRAME
  JMP main_loop
