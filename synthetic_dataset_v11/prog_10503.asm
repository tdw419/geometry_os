; DESCRIPTION: Draws a black line from (31, 112) to (139, 84).
; PLAN: r0=31(x1), r1=112(y1), r2=139(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 112
LDI r2, 139
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
