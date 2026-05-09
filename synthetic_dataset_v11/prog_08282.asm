; DESCRIPTION: Places a white line segment connecting (191, 78) to (24, 95).
; PLAN: r0=191(x1), r1=78(y1), r2=24(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 78
LDI r2, 24
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
