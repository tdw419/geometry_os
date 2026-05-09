; DESCRIPTION: Draws a black line from (289, 253) to (461, 233).
; PLAN: r0=289(x1), r1=253(y1), r2=461(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 253
LDI r2, 461
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
