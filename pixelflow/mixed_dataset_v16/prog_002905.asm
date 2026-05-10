; DESCRIPTION: Draws a black line from (448, 7) to (136, 246).
; PLAN: r0=448(x1), r1=7(y1), r2=136(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 7
LDI r2, 136
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
