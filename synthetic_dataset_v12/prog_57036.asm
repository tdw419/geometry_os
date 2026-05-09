; DESCRIPTION: Draws a black line from (328, 78) to (51, 21).
; PLAN: r0=328(x1), r1=78(y1), r2=51(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 78
LDI r2, 51
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
