; DESCRIPTION: Geometry OS program to draw a colored object.

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
LDI r7, 0x202020
FILL r7

; --- title bar: RECTF at (0,0) 256x30, colour #555555 ---
LDI r2, 0
LDI r6, 0
LDI r15, 256
LDI r8, 30
LDI r4, 0x555555
RECTF r2, r6, r15, r8, r4

; --- title text "Hello" at (100, 10) ---
LDI r12, 0x2000
LDI r7, 72         ; H
STORE r12, r7
LDI r12, 0x2001
LDI r7, 101        ; e
STORE r12, r7
LDI r12, 0x2002
LDI r7, 108        ; l
STORE r12, r7
LDI r12, 0x2003
LDI r7, 108        ; l
STORE r12, r7
LDI r12, 0x2004
LDI r7, 111        ; o
STORE r12, r7
LDI r12, 0x2005
LDI r7, 0          ; NUL
STORE r12, r7
LDI r2, 100
LDI r6, 10
LDI r15, 0x2000
TEXT r2, r6, r15

; --- OK button body: RECTF at (88, 110) 80x28, colour #2266FF ---
LDI r2, 88
LDI r6, 110
LDI r15, 80
LDI r8, 28
LDI r4, 0x2266FF
RECTF r2, r6, r15, r8, r4

; --- register the same rect as hit-region id=1 ---
; r2..r8 still hold x,y,w,h from the RECTF above
HITSET r2, r6, r15, r8, 1

; --- button label "OK" at (120, 118) ---
LDI r12, 0x2010
LDI r7, 79         ; O
STORE r12, r7
LDI r12, 0x2011
LDI r7, 75         ; K
STORE r12, r7
LDI r12, 0x2012
LDI r7, 0
STORE r12, r7
LDI r2, 120
LDI r6, 118
LDI r15, 0x2010
TEXT r2, r6, r15

; --- demo: query cursor, put matched id in r0 ---
; (Host sets cursor via vm.push_mouse(x,y); without that, r0 = 0.)
HITQ r0

HALT
