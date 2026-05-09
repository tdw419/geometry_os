; DESCRIPTION: Composite: . Then Places a blue line segment connecting (251, 77) to (239, 84). Then Places a orange circle of radius 19 at center (183, 103).
; PLAN: r0=251(x1), r1=77(y1), r2=239(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=183(x), r1=103(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue line segment connecting (251, 77) to (239, 84).
; PLAN: r0=251(x1), r1=77(y1), r2=239(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 77
LDI r2, 239
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange circle of radius 19 at center (183, 103).
; PLAN: r0=183(x), r1=103(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 103
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
