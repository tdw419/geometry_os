; DESCRIPTION: Places a green line segment connecting (252, 172) to (498, 112).
; PLAN: r0=252(x1), r1=172(y1), r2=498(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 172
LDI r2, 498
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
