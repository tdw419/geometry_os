; 043_pixel_landscape.asm - Simple pixel art landscape
; Sky gradient (blue), green ground, yellow sun, gray mountains

; Fill sky (top half) with blue
LDI r0, 0
LDI r1, 0
LDI r2, 256
LDI r3, 180
LDI r4, 0x2244AA
RECTF r0, r1, r2, r3, r4

; Fill ground (bottom) with green
LDI r0, 0
LDI r1, 180
LDI r2, 256
LDI r3, 76
LDI r4, 0x22AA22
RECTF r0, r1, r2, r3, r4

; Draw sun (circle at 200, 50, radius 25, yellow)
LDI r0, 200
LDI r1, 50
LDI r2, 25
LDI r3, 0xFFDD00
CIRCLE r0, r1, r2, r3

; Draw far mountain (triangle-ish using LINE)
; Mountain 1 peak at (80, 130)
LDI r0, 20
LDI r1, 180
LDI r2, 80
LDI r3, 100
LDI r4, 0x666688
LINE r0, r1, r2, r3, r4
LDI r0, 80
LDI r1, 100
LDI r2, 140
LDI r3, 180
LINE r0, r1, r2, r3, r4
LDI r0, 20
LDI r1, 180
LDI r2, 140
LDI r3, 180
LINE r0, r1, r2, r3, r4

; Mountain 2 peak at (180, 120)
LDI r0, 120
LDI r1, 180
LDI r2, 180
LDI r3, 90
LDI r4, 0x555577
LINE r0, r1, r2, r3, r4
LDI r0, 180
LDI r1, 90
LDI r2, 240
LDI r3, 180
LINE r0, r1, r2, r3, r4
LDI r0, 120
LDI r1, 180
LDI r2, 240
LDI r3, 180
LINE r0, r1, r2, r3, r4

; Draw some clouds (small white rectangles)
LDI r0, 30
LDI r1, 30
LDI r2, 40
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4

LDI r0, 140
LDI r1, 55
LDI r2, 50
LDI r3, 8
RECTF r0, r1, r2, r3, r4

; Draw a simple tree trunk and canopy
; Trunk
LDI r0, 60
LDI r1, 155
LDI r2, 8
LDI r3, 25
LDI r4, 0x663300
RECTF r0, r1, r2, r3, r4

; Canopy (green circle)
LDI r0, 64
LDI r1, 148
LDI r2, 18
LDI r3, 0x00AA00
CIRCLE r0, r1, r2, r3

; Another tree
LDI r0, 210
LDI r1, 158
LDI r2, 6
LDI r3, 22
LDI r4, 0x663300
RECTF r0, r1, r2, r3, r4

LDI r0, 213
LDI r1, 150
LDI r2, 14
LDI r3, 0x008800
CIRCLE r0, r1, r2, r3

HALT
