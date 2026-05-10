; DESCRIPTION: Places a white line segment connecting (237, 110) to (426, 4).
; PLAN: r0=237(x1), r1=110(y1), r2=426(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 110
LDI r2, 426
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
