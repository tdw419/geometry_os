; DESCRIPTION: Draws a black line from (381, 15) to (208, 51).
; PLAN: r0=381(x1), r1=15(y1), r2=208(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 15
LDI r2, 208
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
