; DESCRIPTION: Draws a black line from (399, 142) to (189, 80).
; PLAN: r0=399(x1), r1=142(y1), r2=189(x2), r3=80(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 142
LDI r2, 189
LDI r3, 80
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
