; DESCRIPTION: Render a colored object at the screen.

; hello_window.asm -- Token-to-Pixel GUI "Hello World"
;
; Proves the full loop: RECTF draws pixels, HITSET makes them semantic,
; HITQ reads the cursor. This is the minimum-viable GUI in Geometry OS.
;
; Layout (256x256 screen):
;   +-----------------------------+
;   | #555555 title bar (30px)    |
;   | "Hello"                     |
;   +-----------------------------+
;   |                             |
;   |   [ #2266FF OK button ]     |
;   |                             |
;   +-----------------------------+
;
; After HALT:
;   - vm.screen has the rendered UI
;   - vm.hit_regions has 1 entry (the OK button) with id=1
;   - A host that calls vm.push_mouse(x, y) and re-runs HITQ gets the id back

; --- background fill (dark grey) ---
LDI r0, 0x202020
FILL r0

; --- title bar: RECTF at (0,0) 256x30, colour #555555 ---
LDI r13, 0
LDI r8, 0
LDI r14, 256
LDI r2, 30
LDI r15, 0x555555
RECTF r13, r8, r14, r2, r15

; --- title text "Hello" at (100, 10) ---
LDI r12, 0x2000
LDI r0, 72         ; H
STORE r12, r0
LDI r12, 0x2001
LDI r0, 101        ; e
STORE r12, r0
LDI r12, 0x2002
LDI r0, 108        ; l
STORE r12, r0
LDI r12, 0x2003
LDI r0, 108        ; l
STORE r12, r0
LDI r12, 0x2004
LDI r0, 111        ; o
STORE r12, r0
LDI r12, 0x2005
LDI r0, 0          ; NUL
STORE r12, r0
LDI r13, 100
LDI r8, 10
LDI r14, 0x2000
TEXT r13, r8, r14

; --- OK button body: RECTF at (88, 110) 80x28, colour #2266FF ---
LDI r13, 88
LDI r8, 110
LDI r14, 80
LDI r2, 28
LDI r15, 0x2266FF
RECTF r13, r8, r14, r2, r15

; --- register the same rect as hit-region id=1 ---
; r13..r2 still hold x,y,w,h from the RECTF above
HITSET r13, r8, r14, r2, 1

; --- button label "OK" at (120, 118) ---
LDI r12, 0x2010
LDI r0, 79         ; O
STORE r12, r0
LDI r12, 0x2011
LDI r0, 75         ; K
STORE r12, r0
LDI r12, 0x2012
LDI r0, 0
STORE r12, r0
LDI r13, 120
LDI r8, 118
LDI r14, 0x2010
TEXT r13, r8, r14

; --- demo: query cursor, put matched id in r7 ---
; (Host sets cursor via vm.push_mouse(x,y); without that, r7 = 0.)
HITQ r7

HALT
