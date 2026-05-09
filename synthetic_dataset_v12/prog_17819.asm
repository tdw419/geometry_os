; DESCRIPTION: Places a blue line segment connecting (246, 248) to (283, 89).
; PLAN: r0=246(x1), r1=248(y1), r2=283(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 248
LDI r2, 283
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
