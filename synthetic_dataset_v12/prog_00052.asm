; DESCRIPTION: Places a black line segment connecting (18, 253) to (461, 92).
; PLAN: r0=18(x1), r1=253(y1), r2=461(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 253
LDI r2, 461
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
