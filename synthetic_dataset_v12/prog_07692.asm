; DESCRIPTION: Places a purple line segment connecting (275, 172) to (30, 233).
; PLAN: r0=275(x1), r1=172(y1), r2=30(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 172
LDI r2, 30
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
