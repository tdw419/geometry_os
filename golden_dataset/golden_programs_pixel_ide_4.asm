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
LDI r10, 0

; ---- Write title strings to RAM ----

; "Editor" at 0x9000
LDI r0, 0x9000
LDI r7, 69; STORE r0, r7; ADD r0, r12
LDI r7, 100; STORE r0, r7; ADD r0, r12
LDI r7, 105; STORE r0, r7; ADD r0, r12
LDI r7, 116; STORE r0, r7; ADD r0, r12
LDI r7, 111; STORE r0, r7; ADD r0, r12
LDI r7, 114; STORE r0, r7; ADD r0, r12
LDI r7, 0; STORE r0, r7

; "Build" at 0x9010
LDI r0, 0x9010
LDI r7, 66; STORE r0, r7; ADD r0, r12
LDI r7, 117; STORE r0, r7; ADD r0, r12
LDI r7, 105; STORE r0, r7; ADD r0, r12
LDI r7, 108; STORE r0, r7; ADD r0, r12
LDI r7, 100; STORE r0, r7; ADD r0, r12
LDI r7, 0; STORE r0, r7

; "Output" at 0x9020
LDI r0, 0x9020
LDI r7, 79; STORE r0, r7; ADD r0, r12
LDI r7, 117; STORE r0, r7; ADD r0, r12
LDI r7, 116; STORE r0, r7; ADD r0, r12
LDI r7, 112; STORE r0, r7; ADD r0, r12
LDI r7, 117; STORE r0, r7; ADD r0, r12
LDI r7, 116; STORE r0, r7; ADD r0, r12
LDI r7, 0; STORE r0, r7

; ---- Write source code text to RAM for display ----
; "LDI r0, 42" at 0x9030
LDI r0, 0x9030
LDI r7, 76; STORE r0, r7; ADD r0, r12
LDI r7, 68; STORE r0, r7; ADD r0, r12
LDI r7, 73; STORE r0, r7; ADD r0, r12
LDI r7, 32; STORE r0, r7; ADD r0, r12
LDI r7, 114; STORE r0, r7; ADD r0, r12
LDI r7, 49; STORE r0, r7; ADD r0, r12
LDI r7, 44; STORE r0, r7; ADD r0, r12
LDI r7, 32; STORE r0, r7; ADD r0, r12
LDI r7, 52; STORE r0, r7; ADD r0, r12
LDI r7, 50; STORE r0, r7; ADD r0, r12
LDI r7, 10; STORE r0, r7; ADD r0, r12
LDI r7, 72; STORE r0, r7; ADD r0, r12
LDI r7, 65; STORE r0, r7; ADD r0, r12
LDI r7, 76; STORE r0, r7; ADD r0, r12
LDI r7, 84; STORE r0, r7; ADD r0, r12
LDI r7, 0; STORE r0, r7

; "OK: 3 words" at 0x9050
LDI r0, 0x9050
LDI r7, 79; STORE r0, r7; ADD r0, r12
LDI r7, 75; STORE r0, r7; ADD r0, r12
LDI r7, 58; STORE r0, r7; ADD r0, r12
LDI r7, 32; STORE r0, r7; ADD r0, r12
LDI r7, 51; STORE r0, r7; ADD r0, r12
LDI r7, 32; STORE r0, r7; ADD r0, r12
LDI r7, 119; STORE r0, r7; ADD r0, r12
LDI r7, 111; STORE r0, r7; ADD r0, r12
LDI r7, 114; STORE r0, r7; ADD r0, r12
LDI r7, 100; STORE r0, r7; ADD r0, r12
LDI r7, 115; STORE r0, r7; ADD r0, r12
LDI r7, 0; STORE r0, r7

; ---- Create three windows ----

; Window 1: Editor (top-left) -- x=8, y=8, w=118, h=100
LDI r0, 8
LDI r7, 8
LDI r6, 118
LDI r14, 100
LDI r3, 0x9000
LDI r1, 0
WINSYS r1
; r8 = window_id for editor (should be 1)

; Save editor window id
MOV r2, r8

; Window 2: Build (top-right) -- x=130, y=8, w=118, h=100
LDI r0, 130
LDI r7, 8
LDI r6, 118
LDI r14, 100
LDI r3, 0x9010
LDI r1, 0
WINSYS r1
MOV r5, r8

; Window 3: Output (bottom) -- x=8, y=116, w=240, h=132
LDI r0, 8
LDI r7, 116
LDI r6, 240
LDI r14, 132
LDI r3, 0x9020
LDI r1, 0
WINSYS r1
MOV r4, r8

; ---- Draw editor window content ----
; Fill editor with dark blue background
LDI r15, 0x000022
LDI r13, 0

; Draw source code text into editor window
; Row 1: "LDI r0, 42" -- draw as green pixels
LDI r11, 0x00CC00
LDI r16, 2
LDI r17, 4

; Draw 'L' in editor
LDI r13, 76
WPIXEL r2, r16, r17, r11
ADD r16, r12
LDI r13, 68
WPIXEL r2, r16, r17, r11
ADD r16, r12
LDI r13, 73
WPIXEL r2, r16, r17, r11
ADD r16, r12
LDI r13, 32
WPIXEL r2, r16, r17, r13
ADD r16, r12
LDI r13, 114
WPIXEL r2, r16, r17, r11
ADD r16, r12
LDI r13, 49
WPIXEL r2, r16, r17, r11
ADD r16, r12
LDI r13, 44
WPIXEL r2, r16, r17, r13
ADD r16, r12
LDI r13, 32
WPIXEL r2, r16, r17, r13
ADD r16, r12
LDI r13, 52
WPIXEL r2, r16, r17, r11
ADD r16, r12
LDI r13, 50
WPIXEL r2, r16, r17, r11

; Row 2: "HALT" in editor
LDI r16, 2
LDI r17, 6
LDI r13, 72
WPIXEL r2, r16, r17, r11
ADD r16, r12
LDI r13, 65
WPIXEL r2, r16, r17, r11
ADD r16, r12
LDI r13, 76
WPIXEL r2, r16, r17, r11
ADD r16, r12
LDI r13, 84
WPIXEL r2, r16, r17, r11

; ---- Draw build window content ----
; Green "OK" text
LDI r11, 0x00FF00
LDI r16, 2
LDI r17, 4
LDI r13, 79
WPIXEL r5, r16, r17, r11
ADD r16, r12
LDI r13, 75
WPIXEL r5, r16, r17, r11

; "3 words" in yellow below
LDI r11, 0xFFFF00
LDI r16, 2
LDI r17, 8
LDI r13, 51
WPIXEL r5, r16, r17, r11
ADD r16, r12
LDI r13, 32
WPIXEL r5, r16, r17, r13
ADD r16, r12
LDI r13, 119
WPIXEL r5, r16, r17, r11
ADD r16, r12
LDI r13, 111
WPIXEL r5, r16, r17, r11
ADD r16, r12
LDI r13, 114
WPIXEL r5, r16, r17, r11
ADD r16, r12
LDI r13, 100
WPIXEL r5, r16, r17, r11
ADD r16, r12
LDI r13, 115
WPIXEL r5, r16, r17, r11

; ---- Draw output window content ----
; Draw a colored bar to show "execution result"
LDI r11, 0x4444FF
LDI r16, 0
LDI r17, 10
LDI r18, 240
LDI r19, 0

output_bar:
  CMP r16, r18
  BGE r8, output_done
  WPIXEL r4, r16, r17, r11
  ADD r16, r12
  JMP output_bar

output_done:

; Also draw a smaller green result bar
LDI r11, 0x00FF00
LDI r16, 80
LDI r17, 20
LDI r19, 0

output_green:
  CMP r16, r19
  BGE r8, output_gdone
  ; Check: r19 = 160
  LDI r20, 160
  CMP r16, r20
  BGE r8, output_gdone
  WPIXEL r4, r16, r17, r11
  ADD r16, r12
  JMP output_green

output_gdone:

; ---- Assemble the actual source code and run it ----
; Write "LDI r0, 42\nHALT\n" to 0x0800
LDI r0, 0x0800

LDI r7, 76
CALL wr
LDI r7, 68
CALL wr
LDI r7, 73
CALL wr
LDI r7, 32
CALL wr
LDI r7, 114
CALL wr
LDI r7, 49
CALL wr
LDI r7, 44
CALL wr
LDI r7, 32
CALL wr
LDI r7, 52
CALL wr
LDI r7, 50
CALL wr
LDI r7, 10
CALL wr
LDI r7, 72
CALL wr
LDI r7, 65
CALL wr
LDI r7, 76
CALL wr
LDI r7, 84
CALL wr
LDI r7, 10
CALL wr
LDI r7, 0
CALL wr

; Assemble it
LDI r3, 0x0800
LDI r1, 0x1000
ASM r3, r1

; Run it
JMP 0x1000

; ---- Subroutine: write char to RAM ----
wr:
    STORE r0, r7
    ADD r0, r12
    RET
