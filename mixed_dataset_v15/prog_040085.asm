; DESCRIPTION: Draws a black line from (36, 51) to (310, 249).
; PLAN: r0=36(x1), r1=51(y1), r2=310(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 51
LDI r2, 310
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
