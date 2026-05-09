; DESCRIPTION: Draws a black line from (19, 199) to (2, 51).
; PLAN: r0=19(x1), r1=199(y1), r2=2(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 199
LDI r2, 2
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
