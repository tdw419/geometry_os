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
LDI r1, 1
LDI r5, 0

; ---- Write title strings to RAM ----

; "Editor" at 0x9000
LDI r6, 0x9000
LDI r0, 69; STORE r6, r0; ADD r6, r1
LDI r0, 100; STORE r6, r0; ADD r6, r1
LDI r0, 105; STORE r6, r0; ADD r6, r1
LDI r0, 116; STORE r6, r0; ADD r6, r1
LDI r0, 111; STORE r6, r0; ADD r6, r1
LDI r0, 114; STORE r6, r0; ADD r6, r1
LDI r0, 0; STORE r6, r0

; "Build" at 0x9010
LDI r6, 0x9010
LDI r0, 66; STORE r6, r0; ADD r6, r1
LDI r0, 117; STORE r6, r0; ADD r6, r1
LDI r0, 105; STORE r6, r0; ADD r6, r1
LDI r0, 108; STORE r6, r0; ADD r6, r1
LDI r0, 100; STORE r6, r0; ADD r6, r1
LDI r0, 0; STORE r6, r0

; "Output" at 0x9020
LDI r6, 0x9020
LDI r0, 79; STORE r6, r0; ADD r6, r1
LDI r0, 117; STORE r6, r0; ADD r6, r1
LDI r0, 116; STORE r6, r0; ADD r6, r1
LDI r0, 112; STORE r6, r0; ADD r6, r1
LDI r0, 117; STORE r6, r0; ADD r6, r1
LDI r0, 116; STORE r6, r0; ADD r6, r1
LDI r0, 0; STORE r6, r0

; ---- Write source code text to RAM for display ----
; "LDI r6, 42" at 0x9030
LDI r6, 0x9030
LDI r0, 76; STORE r6, r0; ADD r6, r1
LDI r0, 68; STORE r6, r0; ADD r6, r1
LDI r0, 73; STORE r6, r0; ADD r6, r1
LDI r0, 32; STORE r6, r0; ADD r6, r1
LDI r0, 114; STORE r6, r0; ADD r6, r1
LDI r0, 49; STORE r6, r0; ADD r6, r1
LDI r0, 44; STORE r6, r0; ADD r6, r1
LDI r0, 32; STORE r6, r0; ADD r6, r1
LDI r0, 52; STORE r6, r0; ADD r6, r1
LDI r0, 50; STORE r6, r0; ADD r6, r1
LDI r0, 10; STORE r6, r0; ADD r6, r1
LDI r0, 72; STORE r6, r0; ADD r6, r1
LDI r0, 65; STORE r6, r0; ADD r6, r1
LDI r0, 76; STORE r6, r0; ADD r6, r1
LDI r0, 84; STORE r6, r0; ADD r6, r1
LDI r0, 0; STORE r6, r0

; "OK: 3 words" at 0x9050
LDI r6, 0x9050
LDI r0, 79; STORE r6, r0; ADD r6, r1
LDI r0, 75; STORE r6, r0; ADD r6, r1
LDI r0, 58; STORE r6, r0; ADD r6, r1
LDI r0, 32; STORE r6, r0; ADD r6, r1
LDI r0, 51; STORE r6, r0; ADD r6, r1
LDI r0, 32; STORE r6, r0; ADD r6, r1
LDI r0, 119; STORE r6, r0; ADD r6, r1
LDI r0, 111; STORE r6, r0; ADD r6, r1
LDI r0, 114; STORE r6, r0; ADD r6, r1
LDI r0, 100; STORE r6, r0; ADD r6, r1
LDI r0, 115; STORE r6, r0; ADD r6, r1
LDI r0, 0; STORE r6, r0

; ---- Create three windows ----

; Window 1: Editor (top-left) -- x=8, y=8, w=118, h=100
LDI r6, 8
LDI r0, 8
LDI r2, 118
LDI r13, 100
LDI r10, 0x9000
LDI r15, 0
WINSYS r15
; r3 = window_id for editor (should be 1)

; Save editor window id
MOV r14, r3

; Window 2: Build (top-right) -- x=130, y=8, w=118, h=100
LDI r6, 130
LDI r0, 8
LDI r2, 118
LDI r13, 100
LDI r10, 0x9010
LDI r15, 0
WINSYS r15
MOV r4, r3

; Window 3: Output (bottom) -- x=8, y=116, w=240, h=132
LDI r6, 8
LDI r0, 116
LDI r2, 240
LDI r13, 132
LDI r10, 0x9020
LDI r15, 0
WINSYS r15
MOV r12, r3

; ---- Draw editor window content ----
; Fill editor with dark blue background
LDI r7, 0x000022
LDI r9, 0

; Draw source code text into editor window
; Row 1: "LDI r6, 42" -- draw as green pixels
LDI r8, 0x00CC00
LDI r16, 2
LDI r17, 4

; Draw 'L' in editor
LDI r9, 76
WPIXEL r14, r16, r17, r8
ADD r16, r1
LDI r9, 68
WPIXEL r14, r16, r17, r8
ADD r16, r1
LDI r9, 73
WPIXEL r14, r16, r17, r8
ADD r16, r1
LDI r9, 32
WPIXEL r14, r16, r17, r9
ADD r16, r1
LDI r9, 114
WPIXEL r14, r16, r17, r8
ADD r16, r1
LDI r9, 49
WPIXEL r14, r16, r17, r8
ADD r16, r1
LDI r9, 44
WPIXEL r14, r16, r17, r9
ADD r16, r1
LDI r9, 32
WPIXEL r14, r16, r17, r9
ADD r16, r1
LDI r9, 52
WPIXEL r14, r16, r17, r8
ADD r16, r1
LDI r9, 50
WPIXEL r14, r16, r17, r8

; Row 2: "HALT" in editor
LDI r16, 2
LDI r17, 6
LDI r9, 72
WPIXEL r14, r16, r17, r8
ADD r16, r1
LDI r9, 65
WPIXEL r14, r16, r17, r8
ADD r16, r1
LDI r9, 76
WPIXEL r14, r16, r17, r8
ADD r16, r1
LDI r9, 84
WPIXEL r14, r16, r17, r8

; ---- Draw build window content ----
; Green "OK" text
LDI r8, 0x00FF00
LDI r16, 2
LDI r17, 4
LDI r9, 79
WPIXEL r4, r16, r17, r8
ADD r16, r1
LDI r9, 75
WPIXEL r4, r16, r17, r8

; "3 words" in yellow below
LDI r8, 0xFFFF00
LDI r16, 2
LDI r17, 8
LDI r9, 51
WPIXEL r4, r16, r17, r8
ADD r16, r1
LDI r9, 32
WPIXEL r4, r16, r17, r9
ADD r16, r1
LDI r9, 119
WPIXEL r4, r16, r17, r8
ADD r16, r1
LDI r9, 111
WPIXEL r4, r16, r17, r8
ADD r16, r1
LDI r9, 114
WPIXEL r4, r16, r17, r8
ADD r16, r1
LDI r9, 100
WPIXEL r4, r16, r17, r8
ADD r16, r1
LDI r9, 115
WPIXEL r4, r16, r17, r8

; ---- Draw output window content ----
; Draw a colored bar to show "execution result"
LDI r8, 0x4444FF
LDI r16, 0
LDI r17, 10
LDI r18, 240
LDI r19, 0

output_bar:
  CMP r16, r18
  BGE r3, output_done
  WPIXEL r12, r16, r17, r8
  ADD r16, r1
  JMP output_bar

output_done:

; Also draw a smaller green result bar
LDI r8, 0x00FF00
LDI r16, 80
LDI r17, 20
LDI r19, 0

output_green:
  CMP r16, r19
  BGE r3, output_gdone
  ; Check: r19 = 160
  LDI r20, 160
  CMP r16, r20
  BGE r3, output_gdone
  WPIXEL r12, r16, r17, r8
  ADD r16, r1
  JMP output_green

output_gdone:

; ---- Assemble the actual source code and run it ----
; Write "LDI r6, 42\nHALT\n" to 0x0800
LDI r6, 0x0800

LDI r0, 76
CALL wr
LDI r0, 68
CALL wr
LDI r0, 73
CALL wr
LDI r0, 32
CALL wr
LDI r0, 114
CALL wr
LDI r0, 49
CALL wr
LDI r0, 44
CALL wr
LDI r0, 32
CALL wr
LDI r0, 52
CALL wr
LDI r0, 50
CALL wr
LDI r0, 10
CALL wr
LDI r0, 72
CALL wr
LDI r0, 65
CALL wr
LDI r0, 76
CALL wr
LDI r0, 84
CALL wr
LDI r0, 10
CALL wr
LDI r0, 0
CALL wr

; Assemble it
LDI r10, 0x0800
LDI r15, 0x1000
ASM r10, r15

; Run it
JMP 0x1000

; ---- Subroutine: write char to RAM ----
wr:
    STORE r6, r0
    ADD r6, r1
    RET
