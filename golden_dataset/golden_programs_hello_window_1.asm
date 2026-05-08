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
LDI r7, 0x202020
FILL r7

; --- title bar: RECTF at (0,0) 256x30, colour #555555 ---
LDI r14, 0
LDI r5, 0
LDI r0, 256
LDI r10, 30
LDI r8, 0x555555
RECTF r14, r5, r0, r10, r8

; --- title text "Hello" at (100, 10) ---
LDI r9, 0x2000
LDI r7, 72         ; H
STORE r9, r7
LDI r9, 0x2001
LDI r7, 101        ; e
STORE r9, r7
LDI r9, 0x2002
LDI r7, 108        ; l
STORE r9, r7
LDI r9, 0x2003
LDI r7, 108        ; l
STORE r9, r7
LDI r9, 0x2004
LDI r7, 111        ; o
STORE r9, r7
LDI r9, 0x2005
LDI r7, 0          ; NUL
STORE r9, r7
LDI r14, 100
LDI r5, 10
LDI r0, 0x2000
TEXT r14, r5, r0

; --- OK button body: RECTF at (88, 110) 80x28, colour #2266FF ---
LDI r14, 88
LDI r5, 110
LDI r0, 80
LDI r10, 28
LDI r8, 0x2266FF
RECTF r14, r5, r0, r10, r8

; --- register the same rect as hit-region id=1 ---
; r14..r10 still hold x,y,w,h from the RECTF above
HITSET r14, r5, r0, r10, 1

; --- button label "OK" at (120, 118) ---
LDI r9, 0x2010
LDI r7, 79         ; O
STORE r9, r7
LDI r9, 0x2011
LDI r7, 75         ; K
STORE r9, r7
LDI r9, 0x2012
LDI r7, 0
STORE r9, r7
LDI r14, 120
LDI r5, 118
LDI r0, 0x2010
TEXT r14, r5, r0

; --- demo: query cursor, put matched id in r6 ---
; (Host sets cursor via vm.push_mouse(x,y); without that, r6 = 0.)
HITQ r6

HALT
