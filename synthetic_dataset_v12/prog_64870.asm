; DESCRIPTION: Places a black line segment connecting (273, 172) to (486, 241).
; PLAN: r0=273(x1), r1=172(y1), r2=486(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 172
LDI r2, 486
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
