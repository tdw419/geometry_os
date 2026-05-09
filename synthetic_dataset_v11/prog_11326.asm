; DESCRIPTION: Draws a green line from (109, 105) to (230, 51).
; PLAN: r0=109(x1), r1=105(y1), r2=230(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 105
LDI r2, 230
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
