; DESCRIPTION: Draws a yellow line from (101, 91) to (15, 219).
; PLAN: r0=101(x1), r1=91(y1), r2=15(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 91
LDI r2, 15
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
