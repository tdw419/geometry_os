; DESCRIPTION: Places a purple line segment connecting (173, 165) to (223, 227).
; PLAN: r0=173(x1), r1=165(y1), r2=223(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 165
LDI r2, 223
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
