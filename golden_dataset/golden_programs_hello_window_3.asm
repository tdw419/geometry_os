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
LDI r2, 0x202020
FILL r2

; --- title bar: RECTF at (0,0) 256x30, colour #555555 ---
LDI r11, 0
LDI r0, 0
LDI r3, 256
LDI r15, 30
LDI r4, 0x555555
RECTF r11, r0, r3, r15, r4

; --- title text "Hello" at (100, 10) ---
LDI r13, 0x2000
LDI r2, 72         ; H
STORE r13, r2
LDI r13, 0x2001
LDI r2, 101        ; e
STORE r13, r2
LDI r13, 0x2002
LDI r2, 108        ; l
STORE r13, r2
LDI r13, 0x2003
LDI r2, 108        ; l
STORE r13, r2
LDI r13, 0x2004
LDI r2, 111        ; o
STORE r13, r2
LDI r13, 0x2005
LDI r2, 0          ; NUL
STORE r13, r2
LDI r11, 100
LDI r0, 10
LDI r3, 0x2000
TEXT r11, r0, r3

; --- OK button body: RECTF at (88, 110) 80x28, colour #2266FF ---
LDI r11, 88
LDI r0, 110
LDI r3, 80
LDI r15, 28
LDI r4, 0x2266FF
RECTF r11, r0, r3, r15, r4

; --- register the same rect as hit-region id=1 ---
; r11..r15 still hold x,y,w,h from the RECTF above
HITSET r11, r0, r3, r15, 1

; --- button label "OK" at (120, 118) ---
LDI r13, 0x2010
LDI r2, 79         ; O
STORE r13, r2
LDI r13, 0x2011
LDI r2, 75         ; K
STORE r13, r2
LDI r13, 0x2012
LDI r2, 0
STORE r13, r2
LDI r11, 120
LDI r0, 118
LDI r3, 0x2010
TEXT r11, r0, r3

; --- demo: query cursor, put matched id in r10 ---
; (Host sets cursor via vm.push_mouse(x,y); without that, r10 = 0.)
HITQ r10

HALT
