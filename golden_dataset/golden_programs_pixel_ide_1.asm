; DESCRIPTION: Draws a colored rectangle at the screen with fixed size.

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
LDI r1, 1
LDI r11, 0

; ---- Write title strings to RAM ----

; "Editor" at 0x9000
LDI r3, 0x9000
LDI r12, 69; STORE r3, r12; ADD r3, r1
LDI r12, 100; STORE r3, r12; ADD r3, r1
LDI r12, 105; STORE r3, r12; ADD r3, r1
LDI r12, 116; STORE r3, r12; ADD r3, r1
LDI r12, 111; STORE r3, r12; ADD r3, r1
LDI r12, 114; STORE r3, r12; ADD r3, r1
LDI r12, 0; STORE r3, r12

; "Build" at 0x9010
LDI r3, 0x9010
LDI r12, 66; STORE r3, r12; ADD r3, r1
LDI r12, 117; STORE r3, r12; ADD r3, r1
LDI r12, 105; STORE r3, r12; ADD r3, r1
LDI r12, 108; STORE r3, r12; ADD r3, r1
LDI r12, 100; STORE r3, r12; ADD r3, r1
LDI r12, 0; STORE r3, r12

; "Output" at 0x9020
LDI r3, 0x9020
LDI r12, 79; STORE r3, r12; ADD r3, r1
LDI r12, 117; STORE r3, r12; ADD r3, r1
LDI r12, 116; STORE r3, r12; ADD r3, r1
LDI r12, 112; STORE r3, r12; ADD r3, r1
LDI r12, 117; STORE r3, r12; ADD r3, r1
LDI r12, 116; STORE r3, r12; ADD r3, r1
LDI r12, 0; STORE r3, r12

; ---- Write source code text to RAM for display ----
; "LDI r3, 42" at 0x9030
LDI r3, 0x9030
LDI r12, 76; STORE r3, r12; ADD r3, r1
LDI r12, 68; STORE r3, r12; ADD r3, r1
LDI r12, 73; STORE r3, r12; ADD r3, r1
LDI r12, 32; STORE r3, r12; ADD r3, r1
LDI r12, 114; STORE r3, r12; ADD r3, r1
LDI r12, 49; STORE r3, r12; ADD r3, r1
LDI r12, 44; STORE r3, r12; ADD r3, r1
LDI r12, 32; STORE r3, r12; ADD r3, r1
LDI r12, 52; STORE r3, r12; ADD r3, r1
LDI r12, 50; STORE r3, r12; ADD r3, r1
LDI r12, 10; STORE r3, r12; ADD r3, r1
LDI r12, 72; STORE r3, r12; ADD r3, r1
LDI r12, 65; STORE r3, r12; ADD r3, r1
LDI r12, 76; STORE r3, r12; ADD r3, r1
LDI r12, 84; STORE r3, r12; ADD r3, r1
LDI r12, 0; STORE r3, r12

; "OK: 3 words" at 0x9050
LDI r3, 0x9050
LDI r12, 79; STORE r3, r12; ADD r3, r1
LDI r12, 75; STORE r3, r12; ADD r3, r1
LDI r12, 58; STORE r3, r12; ADD r3, r1
LDI r12, 32; STORE r3, r12; ADD r3, r1
LDI r12, 51; STORE r3, r12; ADD r3, r1
LDI r12, 32; STORE r3, r12; ADD r3, r1
LDI r12, 119; STORE r3, r12; ADD r3, r1
LDI r12, 111; STORE r3, r12; ADD r3, r1
LDI r12, 114; STORE r3, r12; ADD r3, r1
LDI r12, 100; STORE r3, r12; ADD r3, r1
LDI r12, 115; STORE r3, r12; ADD r3, r1
LDI r12, 0; STORE r3, r12

; ---- Create three windows ----

; Window 1: Editor (top-left) -- x=8, y=8, w=118, h=100
LDI r3, 8
LDI r12, 8
LDI r7, 118
LDI r8, 100
LDI r0, 0x9000
LDI r6, 0
WINSYS r6
; r10 = window_id for editor (should be 1)

; Save editor window id
MOV r2, r10

; Window 2: Build (top-right) -- x=130, y=8, w=118, h=100
LDI r3, 130
LDI r12, 8
LDI r7, 118
LDI r8, 100
LDI r0, 0x9010
LDI r6, 0
WINSYS r6
MOV r9, r10

; Window 3: Output (bottom) -- x=8, y=116, w=240, h=132
LDI r3, 8
LDI r12, 116
LDI r7, 240
LDI r8, 132
LDI r0, 0x9020
LDI r6, 0
WINSYS r6
MOV r15, r10

; ---- Draw editor window content ----
; Fill editor with dark blue background
LDI r4, 0x000022
LDI r14, 0

; Draw source code text into editor window
; Row 1: "LDI r3, 42" -- draw as green pixels
LDI r13, 0x00CC00
LDI r16, 2
LDI r17, 4

; Draw 'L' in editor
LDI r14, 76
WPIXEL r2, r16, r17, r13
ADD r16, r1
LDI r14, 68
WPIXEL r2, r16, r17, r13
ADD r16, r1
LDI r14, 73
WPIXEL r2, r16, r17, r13
ADD r16, r1
LDI r14, 32
WPIXEL r2, r16, r17, r14
ADD r16, r1
LDI r14, 114
WPIXEL r2, r16, r17, r13
ADD r16, r1
LDI r14, 49
WPIXEL r2, r16, r17, r13
ADD r16, r1
LDI r14, 44
WPIXEL r2, r16, r17, r14
ADD r16, r1
LDI r14, 32
WPIXEL r2, r16, r17, r14
ADD r16, r1
LDI r14, 52
WPIXEL r2, r16, r17, r13
ADD r16, r1
LDI r14, 50
WPIXEL r2, r16, r17, r13

; Row 2: "HALT" in editor
LDI r16, 2
LDI r17, 6
LDI r14, 72
WPIXEL r2, r16, r17, r13
ADD r16, r1
LDI r14, 65
WPIXEL r2, r16, r17, r13
ADD r16, r1
LDI r14, 76
WPIXEL r2, r16, r17, r13
ADD r16, r1
LDI r14, 84
WPIXEL r2, r16, r17, r13

; ---- Draw build window content ----
; Green "OK" text
LDI r13, 0x00FF00
LDI r16, 2
LDI r17, 4
LDI r14, 79
WPIXEL r9, r16, r17, r13
ADD r16, r1
LDI r14, 75
WPIXEL r9, r16, r17, r13

; "3 words" in yellow below
LDI r13, 0xFFFF00
LDI r16, 2
LDI r17, 8
LDI r14, 51
WPIXEL r9, r16, r17, r13
ADD r16, r1
LDI r14, 32
WPIXEL r9, r16, r17, r14
ADD r16, r1
LDI r14, 119
WPIXEL r9, r16, r17, r13
ADD r16, r1
LDI r14, 111
WPIXEL r9, r16, r17, r13
ADD r16, r1
LDI r14, 114
WPIXEL r9, r16, r17, r13
ADD r16, r1
LDI r14, 100
WPIXEL r9, r16, r17, r13
ADD r16, r1
LDI r14, 115
WPIXEL r9, r16, r17, r13

; ---- Draw output window content ----
; Draw a colored bar to show "execution result"
LDI r13, 0x4444FF
LDI r16, 0
LDI r17, 10
LDI r18, 240
LDI r19, 0

output_bar:
  CMP r16, r18
  BGE r10, output_done
  WPIXEL r15, r16, r17, r13
  ADD r16, r1
  JMP output_bar

output_done:

; Also draw a smaller green result bar
LDI r13, 0x00FF00
LDI r16, 80
LDI r17, 20
LDI r19, 0

output_green:
  CMP r16, r19
  BGE r10, output_gdone
  ; Check: r19 = 160
  LDI r20, 160
  CMP r16, r20
  BGE r10, output_gdone
  WPIXEL r15, r16, r17, r13
  ADD r16, r1
  JMP output_green

output_gdone:

; ---- Assemble the actual source code and run it ----
; Write "LDI r3, 42\nHALT\n" to 0x0800
LDI r3, 0x0800

LDI r12, 76
CALL wr
LDI r12, 68
CALL wr
LDI r12, 73
CALL wr
LDI r12, 32
CALL wr
LDI r12, 114
CALL wr
LDI r12, 49
CALL wr
LDI r12, 44
CALL wr
LDI r12, 32
CALL wr
LDI r12, 52
CALL wr
LDI r12, 50
CALL wr
LDI r12, 10
CALL wr
LDI r12, 72
CALL wr
LDI r12, 65
CALL wr
LDI r12, 76
CALL wr
LDI r12, 84
CALL wr
LDI r12, 10
CALL wr
LDI r12, 0
CALL wr

; Assemble it
LDI r0, 0x0800
LDI r6, 0x1000
ASM r0, r6

; Run it
JMP 0x1000

; ---- Subroutine: write char to RAM ----
wr:
    STORE r3, r12
    ADD r3, r1
    RET
