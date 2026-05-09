; DESCRIPTION: Places a black line segment connecting (261, 253) to (52, 25).
; PLAN: r0=261(x1), r1=253(y1), r2=52(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 253
LDI r2, 52
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
