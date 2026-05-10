; DESCRIPTION: Places a black line segment connecting (394, 184) to (261, 112).
; PLAN: r0=394(x1), r1=184(y1), r2=261(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 184
LDI r2, 261
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
