; DESCRIPTION: Draws a black line from (36, 191) to (26, 112).
; PLAN: r0=36(x1), r1=191(y1), r2=26(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 191
LDI r2, 26
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
