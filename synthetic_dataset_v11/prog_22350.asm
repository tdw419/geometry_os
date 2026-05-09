; DESCRIPTION: Places a green line segment connecting (24, 172) to (251, 36).
; PLAN: r0=24(x1), r1=172(y1), r2=251(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 172
LDI r2, 251
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
