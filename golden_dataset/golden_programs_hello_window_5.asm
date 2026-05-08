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
LDI r11, 0x202020
FILL r11

; --- title bar: RECTF at (0,0) 256x30, colour #555555 ---
LDI r4, 0
LDI r0, 0
LDI r3, 256
LDI r15, 30
LDI r14, 0x555555
RECTF r4, r0, r3, r15, r14

; --- title text "Hello" at (100, 10) ---
LDI r13, 0x2000
LDI r11, 72         ; H
STORE r13, r11
LDI r13, 0x2001
LDI r11, 101        ; e
STORE r13, r11
LDI r13, 0x2002
LDI r11, 108        ; l
STORE r13, r11
LDI r13, 0x2003
LDI r11, 108        ; l
STORE r13, r11
LDI r13, 0x2004
LDI r11, 111        ; o
STORE r13, r11
LDI r13, 0x2005
LDI r11, 0          ; NUL
STORE r13, r11
LDI r4, 100
LDI r0, 10
LDI r3, 0x2000
TEXT r4, r0, r3

; --- OK button body: RECTF at (88, 110) 80x28, colour #2266FF ---
LDI r4, 88
LDI r0, 110
LDI r3, 80
LDI r15, 28
LDI r14, 0x2266FF
RECTF r4, r0, r3, r15, r14

; --- register the same rect as hit-region id=1 ---
; r4..r15 still hold x,y,w,h from the RECTF above
HITSET r4, r0, r3, r15, 1

; --- button label "OK" at (120, 118) ---
LDI r13, 0x2010
LDI r11, 79         ; O
STORE r13, r11
LDI r13, 0x2011
LDI r11, 75         ; K
STORE r13, r11
LDI r13, 0x2012
LDI r11, 0
STORE r13, r11
LDI r4, 120
LDI r0, 118
LDI r3, 0x2010
TEXT r4, r0, r3

; --- demo: query cursor, put matched id in r6 ---
; (Host sets cursor via vm.push_mouse(x,y); without that, r6 = 0.)
HITQ r6

HALT
