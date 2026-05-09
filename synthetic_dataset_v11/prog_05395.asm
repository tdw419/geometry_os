; DESCRIPTION: Places a white line segment connecting (160, 232) to (73, 9).
; PLAN: r0=160(x1), r1=232(y1), r2=73(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 232
LDI r2, 73
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
