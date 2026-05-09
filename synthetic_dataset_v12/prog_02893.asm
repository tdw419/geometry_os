; DESCRIPTION: Places a green line segment connecting (381, 52) to (29, 165).
; PLAN: r0=381(x1), r1=52(y1), r2=29(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 52
LDI r2, 29
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
