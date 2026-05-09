; DESCRIPTION: Composite: . Then Places a white line segment connecting (219, 209) to (215, 15). Then Draws a purple circle centered at (103, 88) with radius 77.
; PLAN: r0=219(x1), r1=209(y1), r2=215(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=103(x), r1=88(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white line segment connecting (219, 209) to (215, 15).
; PLAN: r0=219(x1), r1=209(y1), r2=215(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 209
LDI r2, 215
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple circle centered at (103, 88) with radius 77.
; PLAN: r0=103(x), r1=88(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 88
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
