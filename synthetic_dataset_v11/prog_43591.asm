; DESCRIPTION: Composite: . Then Places a purple circle of radius 49 at center (180, 85). Then Draws a white rectangle at (61, 84) with width 46 and height 99.
; PLAN: r0=180(x), r1=85(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=61(x), r1=84(y), r2=46(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple circle of radius 49 at center (180, 85).
; PLAN: r0=180(x), r1=85(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 85
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white rectangle at (61, 84) with width 46 and height 99.
; PLAN: r0=61(x), r1=84(y), r2=46(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 84
LDI r2, 46
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
