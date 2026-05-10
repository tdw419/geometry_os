; DESCRIPTION: Draws a black line from (246, 51) to (63, 196).
; PLAN: r0=246(x1), r1=51(y1), r2=63(x2), r3=196(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 51
LDI r2, 63
LDI r3, 196
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
