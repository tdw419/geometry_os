; SCATTERED RECTS -- 20 colored rectangles scattered across the screen
; Simulates randomness with hardcoded positions and colors

; Rect 1: red
LDI r0, 10
LDI r1, 20
LDI r2, 40
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4

; Rect 2: green
LDI r0, 80
LDI r1, 50
LDI r2, 35
LDI r3, 45
LDI r4, 0x00CC00
RECTF r0, r1, r2, r3, r4

; Rect 3: blue
LDI r0, 180
LDI r1, 10
LDI r2, 50
LDI r3, 25
LDI r4, 0x0044FF
RECTF r0, r1, r2, r3, r4

; Rect 4: yellow
LDI r0, 30
LDI r1, 120
LDI r2, 60
LDI r3, 20
LDI r4, 0xFFDD00
RECTF r0, r1, r2, r3, r4

; Rect 5: magenta
LDI r0, 200
LDI r1, 90
LDI r2, 30
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4

; Rect 6: cyan
LDI r0, 130
LDI r1, 160
LDI r2, 45
LDI r3, 35
LDI r4, 0x00DDDD
RECTF r0, r1, r2, r3, r4

; Rect 7: orange
LDI r0, 60
LDI r1, 200
LDI r2, 50
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4

; Rect 8: pink
LDI r0, 150
LDI r1, 210
LDI r2, 40
LDI r3, 25
LDI r4, 0xFF66AA
RECTF r0, r1, r2, r3, r4

; Rect 9: lime
LDI r0, 220
LDI r1, 170
LDI r2, 28
LDI r3, 60
LDI r4, 0x88FF00
RECTF r0, r1, r2, r3, r4

; Rect 10: purple
LDI r0, 5
LDI r1, 230
LDI r2, 55
LDI r3, 20
LDI r4, 0x8800CC
RECTF r0, r1, r2, r3, r4

; Rect 11: teal
LDI r0, 100
LDI r1, 5
LDI r2, 25
LDI r3, 40
LDI r4, 0x008888
RECTF r0, r1, r2, r3, r4

; Rect 12: salmon
LDI r0, 170
LDI r1, 130
LDI r2, 38
LDI r3, 28
LDI r4, 0xFA8072
RECTF r0, r1, r2, r3, r4

; Rect 13: gold
LDI r0, 40
LDI r1, 80
LDI r2, 22
LDI r3, 50
LDI r4, 0xFFD700
RECTF r0, r1, r2, r3, r4

; Rect 14: coral
LDI r0, 210
LDI r1, 240
LDI r2, 42
LDI r3, 15
LDI r4, 0xFF7F50
RECTF r0, r1, r2, r3, r4

; Rect 15: sky blue
LDI r0, 120
LDI r1, 100
LDI r2, 30
LDI r3, 30
LDI r4, 0x87CEEB
RECTF r0, r1, r2, r3, r4

; Rect 16: dark green
LDI r0, 15
LDI r1, 170
LDI r2, 48
LDI r3, 22
LDI r4, 0x006400
RECTF r0, r1, r2, r3, r4

; Rect 17: crimson
LDI r0, 190
LDI r1, 50
LDI r2, 35
LDI r3, 40
LDI r4, 0xDC143C
RECTF r0, r1, r2, r3, r4

; Rect 18: slate
LDI r0, 75
LDI r1, 150
LDI r2, 55
LDI r3, 18
LDI r4, 0x708090
RECTF r0, r1, r2, r3, r4

; Rect 19: violet
LDI r0, 240
LDI r1, 200
LDI r2, 15
LDI r3, 50
LDI r4, 0xEE82EE
RECTF r0, r1, r2, r3, r4

; Rect 20: white
LDI r0, 55
LDI r1, 45
LDI r2, 20
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4

HALT
