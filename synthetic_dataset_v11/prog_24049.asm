; DESCRIPTION: Draws a green line from (81, 25) to (88, 101).
; PLAN: r0=81(x1), r1=25(y1), r2=88(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 25
LDI r2, 88
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
