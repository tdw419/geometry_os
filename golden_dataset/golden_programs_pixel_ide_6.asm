; DESCRIPTION: This GeOS assembly code sets up a simple pixel-based Integrated Development Environment (IDE) with three windowed panes: an editor pane for source code text, a build pane for assembly status, and an output pane for program execution results. It uses the WINSYS system calls to create and manage these windows, drawing titles and content into each using pixel manipulation instructions. The IDE also assembles and runs a simple program directly from RAM.

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
LDI r8, 1
LDI r14, 0

; ---- Write title strings to RAM ----

; "Editor" at 0x9000
LDI r6, 0x9000
LDI r10, 69; STORE r6, r10; ADD r6, r8
LDI r10, 100; STORE r6, r10; ADD r6, r8
LDI r10, 105; STORE r6, r10; ADD r6, r8
LDI r10, 116; STORE r6, r10; ADD r6, r8
LDI r10, 111; STORE r6, r10; ADD r6, r8
LDI r10, 114; STORE r6, r10; ADD r6, r8
LDI r10, 0; STORE r6, r10

; "Build" at 0x9010
LDI r6, 0x9010
LDI r10, 66; STORE r6, r10; ADD r6, r8
LDI r10, 117; STORE r6, r10; ADD r6, r8
LDI r10, 105; STORE r6, r10; ADD r6, r8
LDI r10, 108; STORE r6, r10; ADD r6, r8
LDI r10, 100; STORE r6, r10; ADD r6, r8
LDI r10, 0; STORE r6, r10

; "Output" at 0x9020
LDI r6, 0x9020
LDI r10, 79; STORE r6, r10; ADD r6, r8
LDI r10, 117; STORE r6, r10; ADD r6, r8
LDI r10, 116; STORE r6, r10; ADD r6, r8
LDI r10, 112; STORE r6, r10; ADD r6, r8
LDI r10, 117; STORE r6, r10; ADD r6, r8
LDI r10, 116; STORE r6, r10; ADD r6, r8
LDI r10, 0; STORE r6, r10

; ---- Write source code text to RAM for display ----
; "LDI r6, 42" at 0x9030
LDI r6, 0x9030
LDI r10, 76; STORE r6, r10; ADD r6, r8
LDI r10, 68; STORE r6, r10; ADD r6, r8
LDI r10, 73; STORE r6, r10; ADD r6, r8
LDI r10, 32; STORE r6, r10; ADD r6, r8
LDI r10, 114; STORE r6, r10; ADD r6, r8
LDI r10, 49; STORE r6, r10; ADD r6, r8
LDI r10, 44; STORE r6, r10; ADD r6, r8
LDI r10, 32; STORE r6, r10; ADD r6, r8
LDI r10, 52; STORE r6, r10; ADD r6, r8
LDI r10, 50; STORE r6, r10; ADD r6, r8
LDI r10, 10; STORE r6, r10; ADD r6, r8
LDI r10, 72; STORE r6, r10; ADD r6, r8
LDI r10, 65; STORE r6, r10; ADD r6, r8
LDI r10, 76; STORE r6, r10; ADD r6, r8
LDI r10, 84; STORE r6, r10; ADD r6, r8
LDI r10, 0; STORE r6, r10

; "OK: 3 words" at 0x9050
LDI r6, 0x9050
LDI r10, 79; STORE r6, r10; ADD r6, r8
LDI r10, 75; STORE r6, r10; ADD r6, r8
LDI r10, 58; STORE r6, r10; ADD r6, r8
LDI r10, 32; STORE r6, r10; ADD r6, r8
LDI r10, 51; STORE r6, r10; ADD r6, r8
LDI r10, 32; STORE r6, r10; ADD r6, r8
LDI r10, 119; STORE r6, r10; ADD r6, r8
LDI r10, 111; STORE r6, r10; ADD r6, r8
LDI r10, 114; STORE r6, r10; ADD r6, r8
LDI r10, 100; STORE r6, r10; ADD r6, r8
LDI r10, 115; STORE r6, r10; ADD r6, r8
LDI r10, 0; STORE r6, r10

; ---- Create three windows ----

; Window 1: Editor (top-left) -- x=8, y=8, w=118, h=100
LDI r6, 8
LDI r10, 8
LDI r4, 118
LDI r2, 100
LDI r5, 0x9000
LDI r15, 0
WINSYS r15
; r0 = window_id for editor (should be 1)

; Save editor window id
MOV r12, r0

; Window 2: Build (top-right) -- x=130, y=8, w=118, h=100
LDI r6, 130
LDI r10, 8
LDI r4, 118
LDI r2, 100
LDI r5, 0x9010
LDI r15, 0
WINSYS r15
MOV r9, r0

; Window 3: Output (bottom) -- x=8, y=116, w=240, h=132
LDI r6, 8
LDI r10, 116
LDI r4, 240
LDI r2, 132
LDI r5, 0x9020
LDI r15, 0
WINSYS r15
MOV r1, r0

; ---- Draw editor window content ----
; Fill editor with dark blue background
LDI r3, 0x000022
LDI r13, 0

; Draw source code text into editor window
; Row 1: "LDI r6, 42" -- draw as green pixels
LDI r7, 0x00CC00
LDI r16, 2
LDI r17, 4

; Draw 'L' in editor
LDI r13, 76
WPIXEL r12, r16, r17, r7
ADD r16, r8
LDI r13, 68
WPIXEL r12, r16, r17, r7
ADD r16, r8
LDI r13, 73
WPIXEL r12, r16, r17, r7
ADD r16, r8
LDI r13, 32
WPIXEL r12, r16, r17, r13
ADD r16, r8
LDI r13, 114
WPIXEL r12, r16, r17, r7
ADD r16, r8
LDI r13, 49
WPIXEL r12, r16, r17, r7
ADD r16, r8
LDI r13, 44
WPIXEL r12, r16, r17, r13
ADD r16, r8
LDI r13, 32
WPIXEL r12, r16, r17, r13
ADD r16, r8
LDI r13, 52
WPIXEL r12, r16, r17, r7
ADD r16, r8
LDI r13, 50
WPIXEL r12, r16, r17, r7

; Row 2: "HALT" in editor
LDI r16, 2
LDI r17, 6
LDI r13, 72
WPIXEL r12, r16, r17, r7
ADD r16, r8
LDI r13, 65
WPIXEL r12, r16, r17, r7
ADD r16, r8
LDI r13, 76
WPIXEL r12, r16, r17, r7
ADD r16, r8
LDI r13, 84
WPIXEL r12, r16, r17, r7

; ---- Draw build window content ----
; Green "OK" text
LDI r7, 0x00FF00
LDI r16, 2
LDI r17, 4
LDI r13, 79
WPIXEL r9, r16, r17, r7
ADD r16, r8
LDI r13, 75
WPIXEL r9, r16, r17, r7

; "3 words" in yellow below
LDI r7, 0xFFFF00
LDI r16, 2
LDI r17, 8
LDI r13, 51
WPIXEL r9, r16, r17, r7
ADD r16, r8
LDI r13, 32
WPIXEL r9, r16, r17, r13
ADD r16, r8
LDI r13, 119
WPIXEL r9, r16, r17, r7
ADD r16, r8
LDI r13, 111
WPIXEL r9, r16, r17, r7
ADD r16, r8
LDI r13, 114
WPIXEL r9, r16, r17, r7
ADD r16, r8
LDI r13, 100
WPIXEL r9, r16, r17, r7
ADD r16, r8
LDI r13, 115
WPIXEL r9, r16, r17, r7

; ---- Draw output window content ----
; Draw a colored bar to show "execution result"
LDI r7, 0x4444FF
LDI r16, 0
LDI r17, 10
LDI r18, 240
LDI r19, 0

output_bar:
  CMP r16, r18
  BGE r0, output_done
  WPIXEL r1, r16, r17, r7
  ADD r16, r8
  JMP output_bar

output_done:

; Also draw a smaller green result bar
LDI r7, 0x00FF00
LDI r16, 80
LDI r17, 20
LDI r19, 0

output_green:
  CMP r16, r19
  BGE r0, output_gdone
  ; Check: r19 = 160
  LDI r20, 160
  CMP r16, r20
  BGE r0, output_gdone
  WPIXEL r1, r16, r17, r7
  ADD r16, r8
  JMP output_green

output_gdone:

; ---- Assemble the actual source code and run it ----
; Write "LDI r6, 42\nHALT\n" to 0x0800
LDI r6, 0x0800

LDI r10, 76
CALL wr
LDI r10, 68
CALL wr
LDI r10, 73
CALL wr
LDI r10, 32
CALL wr
LDI r10, 114
CALL wr
LDI r10, 49
CALL wr
LDI r10, 44
CALL wr
LDI r10, 32
CALL wr
LDI r10, 52
CALL wr
LDI r10, 50
CALL wr
LDI r10, 10
CALL wr
LDI r10, 72
CALL wr
LDI r10, 65
CALL wr
LDI r10, 76
CALL wr
LDI r10, 84
CALL wr
LDI r10, 10
CALL wr
LDI r10, 0
CALL wr

; Assemble it
LDI r5, 0x0800
LDI r15, 0x1000
ASM r5, r15

; Run it
JMP 0x1000

; ---- Subroutine: write char to RAM ----
wr:
    STORE r6, r10
    ADD r6, r8
    RET
