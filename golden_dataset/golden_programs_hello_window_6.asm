; DESCRIPTION: This GeOS assembly code creates a minimalistic GUI with a dark grey background, a title bar with the text "Hello", and an OK button. The code fills the screen with pixels, defines semantic regions for interaction (specifically for the OK button), and queries cursor interactions to return the ID of the clicked region.

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
LDI r6, 0x202020
FILL r6

; --- title bar: RECTF at (0,0) 256x30, colour #555555 ---
LDI r10, 0
LDI r5, 0
LDI r4, 256
LDI r15, 30
LDI r12, 0x555555
RECTF r10, r5, r4, r15, r12

; --- title text "Hello" at (100, 10) ---
LDI r0, 0x2000
LDI r6, 72         ; H
STORE r0, r6
LDI r0, 0x2001
LDI r6, 101        ; e
STORE r0, r6
LDI r0, 0x2002
LDI r6, 108        ; l
STORE r0, r6
LDI r0, 0x2003
LDI r6, 108        ; l
STORE r0, r6
LDI r0, 0x2004
LDI r6, 111        ; o
STORE r0, r6
LDI r0, 0x2005
LDI r6, 0          ; NUL
STORE r0, r6
LDI r10, 100
LDI r5, 10
LDI r4, 0x2000
TEXT r10, r5, r4

; --- OK button body: RECTF at (88, 110) 80x28, colour #2266FF ---
LDI r10, 88
LDI r5, 110
LDI r4, 80
LDI r15, 28
LDI r12, 0x2266FF
RECTF r10, r5, r4, r15, r12

; --- register the same rect as hit-region id=1 ---
; r10..r15 still hold x,y,w,h from the RECTF above
HITSET r10, r5, r4, r15, 1

; --- button label "OK" at (120, 118) ---
LDI r0, 0x2010
LDI r6, 79         ; O
STORE r0, r6
LDI r0, 0x2011
LDI r6, 75         ; K
STORE r0, r6
LDI r0, 0x2012
LDI r6, 0
STORE r0, r6
LDI r10, 120
LDI r5, 118
LDI r4, 0x2010
TEXT r10, r5, r4

; --- demo: query cursor, put matched id in r7 ---
; (Host sets cursor via vm.push_mouse(x,y); without that, r7 = 0.)
HITQ r7

HALT
