; DESCRIPTION: Places a cyan line segment connecting (357, 89) to (167, 129).
; PLAN: r0=357(x1), r1=89(y1), r2=167(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 89
LDI r2, 167
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
