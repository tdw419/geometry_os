; SCATTERED RECTANGLES -- 20 colored rectangles scattered across the screen
; Uses hardcoded positions, sizes, and colors for variety

; Rect 1: red, top-left area
LDI r0, 10
LDI r1, 15
LDI r2, 45
LDI r3, 30
LDI r4, 0xFF2222
RECTF r0, r1, r2, r3, r4

; Rect 2: blue, center-top
LDI r0, 100
LDI r1, 8
LDI r2, 55
LDI r3, 35
LDI r4, 0x2266FF
RECTF r0, r1, r2, r3, r4

; Rect 3: green, right area
LDI r0, 200
LDI r1, 50
LDI r2, 40
LDI r3, 60
LDI r4, 0x22CC44
RECTF r0, r1, r2, r3, r4

; Rect 4: yellow, bottom-left
LDI r0, 20
LDI r1, 180
LDI r2, 70
LDI r3, 25
LDI r4, 0xFFDD00
RECTF r0, r1, r2, r3, r4

; Rect 5: magenta, center
LDI r0, 90
LDI r1, 100
LDI r2, 50
LDI r3, 50
LDI r4, 0xFF44FF
RECTF r0, r1, r2, r3, r4

; Rect 6: cyan, top-right
LDI r0, 180
LDI r1, 5
LDI r2, 60
LDI r3, 40
LDI r4, 0x00DDDD
RECTF r0, r1, r2, r3, r4

; Rect 7: orange, left-middle
LDI r0, 5
LDI r1, 80
LDI r2, 55
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4

; Rect 8: purple, bottom-center
LDI r0, 120
LDI r1, 200
LDI r2, 65
LDI r3, 30
LDI r4, 0x8833CC
RECTF r0, r1, r2, r3, r4

; Rect 9: lime, center-right
LDI r0, 210
LDI r1, 120
LDI r2, 35
LDI r3, 55
LDI r4, 0xAAFF00
RECTF r0, r1, r2, r3, r4

; Rect 10: pink, near top-center
LDI r0, 60
LDI r1, 55
LDI r2, 30
LDI r3, 40
LDI r4, 0xFF88AA
RECTF r0, r1, r2, r3, r4

; Rect 11: dark red, bottom-right
LDI r0, 170
LDI r1, 210
LDI r2, 75
LDI r3, 35
LDI r4, 0xAA1111
RECTF r0, r1, r2, r3, r4

; Rect 12: teal, left side
LDI r0, 0
LDI r1, 140
LDI r2, 50
LDI r3, 30
LDI r4, 0x118888
RECTF r0, r1, r2, r3, r4

; Rect 13: bright green, scattered
LDI r0, 140
LDI r1, 60
LDI r2, 40
LDI r3, 25
LDI r4, 0x00FF66
RECTF r0, r1, r2, r3, r4

; Rect 14: salmon, lower-left
LDI r0, 30
LDI r1, 225
LDI r2, 80
LDI r3, 20
LDI r4, 0xFF7766
RECTF r0, r1, r2, r3, r4

; Rect 15: navy, top area
LDI r0, 150
LDI r1, 30
LDI r2, 35
LDI r3, 45
LDI r4, 0x223366
RECTF r0, r1, r2, r3, r4

; Rect 16: gold, center-bottom
LDI r0, 80
LDI r1, 160
LDI r2, 60
LDI r3, 40
LDI r4, 0xDDBB00
RECTF r0, r1, r2, r3, r4

; Rect 17: sky blue, right edge
LDI r0, 220
LDI r1, 180
LDI r2, 30
LDI r3, 50
LDI r4, 0x66BBFF
RECTF r0, r1, r2, r3, r4

; Rect 18: maroon, center-left
LDI r0, 40
LDI r1, 115
LDI r2, 45
LDI r3, 35
LDI r4, 0x770022
RECTF r0, r1, r2, r3, r4

; Rect 19: olive, bottom area
LDI r0, 130
LDI r1, 240
LDI r2, 55
LDI r3, 15
LDI r4, 0x888822
RECTF r0, r1, r2, r3, r4

; Rect 20: white, small accent top-left
LDI r0, 70
LDI r1, 0
LDI r2, 20
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4

HALT
