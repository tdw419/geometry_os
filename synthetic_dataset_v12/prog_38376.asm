; DESCRIPTION: Draws a yellow line from (30, 51) to (261, 176).
; PLAN: r0=30(x1), r1=51(y1), r2=261(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 51
LDI r2, 261
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
