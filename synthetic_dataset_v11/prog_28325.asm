; DESCRIPTION: Draws a black line from (196, 101) to (8, 155).
; PLAN: r0=196(x1), r1=101(y1), r2=8(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 101
LDI r2, 8
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
