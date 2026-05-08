; DESCRIPTION: Render a colored rectangle at the screen.

; pixel_ide.asm -- Windowed IDE Demo (Phase 70)
;
; Demonstrates a simple pixel IDE with three windowed panes:
; 1. Editor pane (top-left): Shows source code text
; 2. Build pane (top-right): Shows assembly status
; 3. Output pane (bottom): Shows program execution result
;
; The IDE writes a simple program to the canvas, assembles it,
; and shows the result in the output window.
; Uses WINSYS to create three windows, then draws into them.

; ---- Constants ----
LDI r20, 0x9000       ; title string storage
LDI r12, 1
LDI r0, 0

; ---- Write title strings to RAM ----

; "Editor" at 0x9000
LDI r7, 0x9000
LDI r8, 69; STORE r7, r8; ADD r7, r12
LDI r8, 100; STORE r7, r8; ADD r7, r12
LDI r8, 105; STORE r7, r8; ADD r7, r12
LDI r8, 116; STORE r7, r8; ADD r7, r12
LDI r8, 111; STORE r7, r8; ADD r7, r12
LDI r8, 114; STORE r7, r8; ADD r7, r12
LDI r8, 0; STORE r7, r8

; "Build" at 0x9010
LDI r7, 0x9010
LDI r8, 66; STORE r7, r8; ADD r7, r12
LDI r8, 117; STORE r7, r8; ADD r7, r12
LDI r8, 105; STORE r7, r8; ADD r7, r12
LDI r8, 108; STORE r7, r8; ADD r7, r12
LDI r8, 100; STORE r7, r8; ADD r7, r12
LDI r8, 0; STORE r7, r8

; "Output" at 0x9020
LDI r7, 0x9020
LDI r8, 79; STORE r7, r8; ADD r7, r12
LDI r8, 117; STORE r7, r8; ADD r7, r12
LDI r8, 116; STORE r7, r8; ADD r7, r12
LDI r8, 112; STORE r7, r8; ADD r7, r12
LDI r8, 117; STORE r7, r8; ADD r7, r12
LDI r8, 116; STORE r7, r8; ADD r7, r12
LDI r8, 0; STORE r7, r8

; ---- Write source code text to RAM for display ----
; "LDI r7, 42" at 0x9030
LDI r7, 0x9030
LDI r8, 76; STORE r7, r8; ADD r7, r12
LDI r8, 68; STORE r7, r8; ADD r7, r12
LDI r8, 73; STORE r7, r8; ADD r7, r12
LDI r8, 32; STORE r7, r8; ADD r7, r12
LDI r8, 114; STORE r7, r8; ADD r7, r12
LDI r8, 49; STORE r7, r8; ADD r7, r12
LDI r8, 44; STORE r7, r8; ADD r7, r12
LDI r8, 32; STORE r7, r8; ADD r7, r12
LDI r8, 52; STORE r7, r8; ADD r7, r12
LDI r8, 50; STORE r7, r8; ADD r7, r12
LDI r8, 10; STORE r7, r8; ADD r7, r12
LDI r8, 72; STORE r7, r8; ADD r7, r12
LDI r8, 65; STORE r7, r8; ADD r7, r12
LDI r8, 76; STORE r7, r8; ADD r7, r12
LDI r8, 84; STORE r7, r8; ADD r7, r12
LDI r8, 0; STORE r7, r8

; "OK: 3 words" at 0x9050
LDI r7, 0x9050
LDI r8, 79; STORE r7, r8; ADD r7, r12
LDI r8, 75; STORE r7, r8; ADD r7, r12
LDI r8, 58; STORE r7, r8; ADD r7, r12
LDI r8, 32; STORE r7, r8; ADD r7, r12
LDI r8, 51; STORE r7, r8; ADD r7, r12
LDI r8, 32; STORE r7, r8; ADD r7, r12
LDI r8, 119; STORE r7, r8; ADD r7, r12
LDI r8, 111; STORE r7, r8; ADD r7, r12
LDI r8, 114; STORE r7, r8; ADD r7, r12
LDI r8, 100; STORE r7, r8; ADD r7, r12
LDI r8, 115; STORE r7, r8; ADD r7, r12
LDI r8, 0; STORE r7, r8

; ---- Create three windows ----

; Window 1: Editor (top-left) -- x=8, y=8, w=118, h=100
LDI r7, 8
LDI r8, 8
LDI r2, 118
LDI r3, 100
LDI r6, 0x9000
LDI r14, 0
WINSYS r14
; r11 = window_id for editor (should be 1)

; Save editor window id
MOV r5, r11

; Window 2: Build (top-right) -- x=130, y=8, w=118, h=100
LDI r7, 130
LDI r8, 8
LDI r2, 118
LDI r3, 100
LDI r6, 0x9010
LDI r14, 0
WINSYS r14
MOV r1, r11

; Window 3: Output (bottom) -- x=8, y=116, w=240, h=132
LDI r7, 8
LDI r8, 116
LDI r2, 240
LDI r3, 132
LDI r6, 0x9020
LDI r14, 0
WINSYS r14
MOV r15, r11

; ---- Draw editor window content ----
; Fill editor with dark blue background
LDI r4, 0x000022
LDI r9, 0

; Draw source code text into editor window
; Row 1: "LDI r7, 42" -- draw as green pixels
LDI r13, 0x00CC00
LDI r16, 2
LDI r17, 4

; Draw 'L' in editor
LDI r9, 76
WPIXEL r5, r16, r17, r13
ADD r16, r12
LDI r9, 68
WPIXEL r5, r16, r17, r13
ADD r16, r12
LDI r9, 73
WPIXEL r5, r16, r17, r13
ADD r16, r12
LDI r9, 32
WPIXEL r5, r16, r17, r9
ADD r16, r12
LDI r9, 114
WPIXEL r5, r16, r17, r13
ADD r16, r12
LDI r9, 49
WPIXEL r5, r16, r17, r13
ADD r16, r12
LDI r9, 44
WPIXEL r5, r16, r17, r9
ADD r16, r12
LDI r9, 32
WPIXEL r5, r16, r17, r9
ADD r16, r12
LDI r9, 52
WPIXEL r5, r16, r17, r13
ADD r16, r12
LDI r9, 50
WPIXEL r5, r16, r17, r13

; Row 2: "HALT" in editor
LDI r16, 2
LDI r17, 6
LDI r9, 72
WPIXEL r5, r16, r17, r13
ADD r16, r12
LDI r9, 65
WPIXEL r5, r16, r17, r13
ADD r16, r12
LDI r9, 76
WPIXEL r5, r16, r17, r13
ADD r16, r12
LDI r9, 84
WPIXEL r5, r16, r17, r13

; ---- Draw build window content ----
; Green "OK" text
LDI r13, 0x00FF00
LDI r16, 2
LDI r17, 4
LDI r9, 79
WPIXEL r1, r16, r17, r13
ADD r16, r12
LDI r9, 75
WPIXEL r1, r16, r17, r13

; "3 words" in yellow below
LDI r13, 0xFFFF00
LDI r16, 2
LDI r17, 8
LDI r9, 51
WPIXEL r1, r16, r17, r13
ADD r16, r12
LDI r9, 32
WPIXEL r1, r16, r17, r9
ADD r16, r12
LDI r9, 119
WPIXEL r1, r16, r17, r13
ADD r16, r12
LDI r9, 111
WPIXEL r1, r16, r17, r13
ADD r16, r12
LDI r9, 114
WPIXEL r1, r16, r17, r13
ADD r16, r12
LDI r9, 100
WPIXEL r1, r16, r17, r13
ADD r16, r12
LDI r9, 115
WPIXEL r1, r16, r17, r13

; ---- Draw output window content ----
; Draw a colored bar to show "execution result"
LDI r13, 0x4444FF
LDI r16, 0
LDI r17, 10
LDI r18, 240
LDI r19, 0

output_bar:
  CMP r16, r18
  BGE r11, output_done
  WPIXEL r15, r16, r17, r13
  ADD r16, r12
  JMP output_bar

output_done:

; Also draw a smaller green result bar
LDI r13, 0x00FF00
LDI r16, 80
LDI r17, 20
LDI r19, 0

output_green:
  CMP r16, r19
  BGE r11, output_gdone
  ; Check: r19 = 160
  LDI r20, 160
  CMP r16, r20
  BGE r11, output_gdone
  WPIXEL r15, r16, r17, r13
  ADD r16, r12
  JMP output_green

output_gdone:

; ---- Assemble the actual source code and run it ----
; Write "LDI r7, 42\nHALT\n" to 0x0800
LDI r7, 0x0800

LDI r8, 76
CALL wr
LDI r8, 68
CALL wr
LDI r8, 73
CALL wr
LDI r8, 32
CALL wr
LDI r8, 114
CALL wr
LDI r8, 49
CALL wr
LDI r8, 44
CALL wr
LDI r8, 32
CALL wr
LDI r8, 52
CALL wr
LDI r8, 50
CALL wr
LDI r8, 10
CALL wr
LDI r8, 72
CALL wr
LDI r8, 65
CALL wr
LDI r8, 76
CALL wr
LDI r8, 84
CALL wr
LDI r8, 10
CALL wr
LDI r8, 0
CALL wr

; Assemble it
LDI r6, 0x0800
LDI r14, 0x1000
ASM r6, r14

; Run it
JMP 0x1000

; ---- Subroutine: write char to RAM ----
wr:
    STORE r7, r8
    ADD r7, r12
    RET
