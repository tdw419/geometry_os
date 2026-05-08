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
LDI r1, 1
LDI r11, 0

; ---- Write title strings to RAM ----

; "Editor" at 0x9000
LDI r6, 0x9000
LDI r14, 69; STORE r6, r14; ADD r6, r1
LDI r14, 100; STORE r6, r14; ADD r6, r1
LDI r14, 105; STORE r6, r14; ADD r6, r1
LDI r14, 116; STORE r6, r14; ADD r6, r1
LDI r14, 111; STORE r6, r14; ADD r6, r1
LDI r14, 114; STORE r6, r14; ADD r6, r1
LDI r14, 0; STORE r6, r14

; "Build" at 0x9010
LDI r6, 0x9010
LDI r14, 66; STORE r6, r14; ADD r6, r1
LDI r14, 117; STORE r6, r14; ADD r6, r1
LDI r14, 105; STORE r6, r14; ADD r6, r1
LDI r14, 108; STORE r6, r14; ADD r6, r1
LDI r14, 100; STORE r6, r14; ADD r6, r1
LDI r14, 0; STORE r6, r14

; "Output" at 0x9020
LDI r6, 0x9020
LDI r14, 79; STORE r6, r14; ADD r6, r1
LDI r14, 117; STORE r6, r14; ADD r6, r1
LDI r14, 116; STORE r6, r14; ADD r6, r1
LDI r14, 112; STORE r6, r14; ADD r6, r1
LDI r14, 117; STORE r6, r14; ADD r6, r1
LDI r14, 116; STORE r6, r14; ADD r6, r1
LDI r14, 0; STORE r6, r14

; ---- Write source code text to RAM for display ----
; "LDI r6, 42" at 0x9030
LDI r6, 0x9030
LDI r14, 76; STORE r6, r14; ADD r6, r1
LDI r14, 68; STORE r6, r14; ADD r6, r1
LDI r14, 73; STORE r6, r14; ADD r6, r1
LDI r14, 32; STORE r6, r14; ADD r6, r1
LDI r14, 114; STORE r6, r14; ADD r6, r1
LDI r14, 49; STORE r6, r14; ADD r6, r1
LDI r14, 44; STORE r6, r14; ADD r6, r1
LDI r14, 32; STORE r6, r14; ADD r6, r1
LDI r14, 52; STORE r6, r14; ADD r6, r1
LDI r14, 50; STORE r6, r14; ADD r6, r1
LDI r14, 10; STORE r6, r14; ADD r6, r1
LDI r14, 72; STORE r6, r14; ADD r6, r1
LDI r14, 65; STORE r6, r14; ADD r6, r1
LDI r14, 76; STORE r6, r14; ADD r6, r1
LDI r14, 84; STORE r6, r14; ADD r6, r1
LDI r14, 0; STORE r6, r14

; "OK: 3 words" at 0x9050
LDI r6, 0x9050
LDI r14, 79; STORE r6, r14; ADD r6, r1
LDI r14, 75; STORE r6, r14; ADD r6, r1
LDI r14, 58; STORE r6, r14; ADD r6, r1
LDI r14, 32; STORE r6, r14; ADD r6, r1
LDI r14, 51; STORE r6, r14; ADD r6, r1
LDI r14, 32; STORE r6, r14; ADD r6, r1
LDI r14, 119; STORE r6, r14; ADD r6, r1
LDI r14, 111; STORE r6, r14; ADD r6, r1
LDI r14, 114; STORE r6, r14; ADD r6, r1
LDI r14, 100; STORE r6, r14; ADD r6, r1
LDI r14, 115; STORE r6, r14; ADD r6, r1
LDI r14, 0; STORE r6, r14

; ---- Create three windows ----

; Window 1: Editor (top-left) -- x=8, y=8, w=118, h=100
LDI r6, 8
LDI r14, 8
LDI r7, 118
LDI r2, 100
LDI r9, 0x9000
LDI r5, 0
WINSYS r5
; r4 = window_id for editor (should be 1)

; Save editor window id
MOV r15, r4

; Window 2: Build (top-right) -- x=130, y=8, w=118, h=100
LDI r6, 130
LDI r14, 8
LDI r7, 118
LDI r2, 100
LDI r9, 0x9010
LDI r5, 0
WINSYS r5
MOV r8, r4

; Window 3: Output (bottom) -- x=8, y=116, w=240, h=132
LDI r6, 8
LDI r14, 116
LDI r7, 240
LDI r2, 132
LDI r9, 0x9020
LDI r5, 0
WINSYS r5
MOV r0, r4

; ---- Draw editor window content ----
; Fill editor with dark blue background
LDI r12, 0x000022
LDI r3, 0

; Draw source code text into editor window
; Row 1: "LDI r6, 42" -- draw as green pixels
LDI r10, 0x00CC00
LDI r16, 2
LDI r17, 4

; Draw 'L' in editor
LDI r3, 76
WPIXEL r15, r16, r17, r10
ADD r16, r1
LDI r3, 68
WPIXEL r15, r16, r17, r10
ADD r16, r1
LDI r3, 73
WPIXEL r15, r16, r17, r10
ADD r16, r1
LDI r3, 32
WPIXEL r15, r16, r17, r3
ADD r16, r1
LDI r3, 114
WPIXEL r15, r16, r17, r10
ADD r16, r1
LDI r3, 49
WPIXEL r15, r16, r17, r10
ADD r16, r1
LDI r3, 44
WPIXEL r15, r16, r17, r3
ADD r16, r1
LDI r3, 32
WPIXEL r15, r16, r17, r3
ADD r16, r1
LDI r3, 52
WPIXEL r15, r16, r17, r10
ADD r16, r1
LDI r3, 50
WPIXEL r15, r16, r17, r10

; Row 2: "HALT" in editor
LDI r16, 2
LDI r17, 6
LDI r3, 72
WPIXEL r15, r16, r17, r10
ADD r16, r1
LDI r3, 65
WPIXEL r15, r16, r17, r10
ADD r16, r1
LDI r3, 76
WPIXEL r15, r16, r17, r10
ADD r16, r1
LDI r3, 84
WPIXEL r15, r16, r17, r10

; ---- Draw build window content ----
; Green "OK" text
LDI r10, 0x00FF00
LDI r16, 2
LDI r17, 4
LDI r3, 79
WPIXEL r8, r16, r17, r10
ADD r16, r1
LDI r3, 75
WPIXEL r8, r16, r17, r10

; "3 words" in yellow below
LDI r10, 0xFFFF00
LDI r16, 2
LDI r17, 8
LDI r3, 51
WPIXEL r8, r16, r17, r10
ADD r16, r1
LDI r3, 32
WPIXEL r8, r16, r17, r3
ADD r16, r1
LDI r3, 119
WPIXEL r8, r16, r17, r10
ADD r16, r1
LDI r3, 111
WPIXEL r8, r16, r17, r10
ADD r16, r1
LDI r3, 114
WPIXEL r8, r16, r17, r10
ADD r16, r1
LDI r3, 100
WPIXEL r8, r16, r17, r10
ADD r16, r1
LDI r3, 115
WPIXEL r8, r16, r17, r10

; ---- Draw output window content ----
; Draw a colored bar to show "execution result"
LDI r10, 0x4444FF
LDI r16, 0
LDI r17, 10
LDI r18, 240
LDI r19, 0

output_bar:
  CMP r16, r18
  BGE r4, output_done
  WPIXEL r0, r16, r17, r10
  ADD r16, r1
  JMP output_bar

output_done:

; Also draw a smaller green result bar
LDI r10, 0x00FF00
LDI r16, 80
LDI r17, 20
LDI r19, 0

output_green:
  CMP r16, r19
  BGE r4, output_gdone
  ; Check: r19 = 160
  LDI r20, 160
  CMP r16, r20
  BGE r4, output_gdone
  WPIXEL r0, r16, r17, r10
  ADD r16, r1
  JMP output_green

output_gdone:

; ---- Assemble the actual source code and run it ----
; Write "LDI r6, 42\nHALT\n" to 0x0800
LDI r6, 0x0800

LDI r14, 76
CALL wr
LDI r14, 68
CALL wr
LDI r14, 73
CALL wr
LDI r14, 32
CALL wr
LDI r14, 114
CALL wr
LDI r14, 49
CALL wr
LDI r14, 44
CALL wr
LDI r14, 32
CALL wr
LDI r14, 52
CALL wr
LDI r14, 50
CALL wr
LDI r14, 10
CALL wr
LDI r14, 72
CALL wr
LDI r14, 65
CALL wr
LDI r14, 76
CALL wr
LDI r14, 84
CALL wr
LDI r14, 10
CALL wr
LDI r14, 0
CALL wr

; Assemble it
LDI r9, 0x0800
LDI r5, 0x1000
ASM r9, r5

; Run it
JMP 0x1000

; ---- Subroutine: write char to RAM ----
wr:
    STORE r6, r14
    ADD r6, r1
    RET
