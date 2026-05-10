; DESCRIPTION: Places a white line segment connecting (491, 181) to (375, 136).
; PLAN: r0=491(x1), r1=181(y1), r2=375(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 181
LDI r2, 375
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
