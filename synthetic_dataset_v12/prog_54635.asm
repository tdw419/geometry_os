; DESCRIPTION: Draws a yellow line from (33, 99) to (51, 4).
; PLAN: r0=33(x1), r1=99(y1), r2=51(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 99
LDI r2, 51
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
