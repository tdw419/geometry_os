; DESCRIPTION: Places a white line segment connecting (38, 21) to (357, 167).
; PLAN: r0=38(x1), r1=21(y1), r2=357(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 21
LDI r2, 357
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
