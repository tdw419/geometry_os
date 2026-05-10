; DESCRIPTION: Draws a yellow line from (226, 7) to (99, 88).
; PLAN: r0=226(x1), r1=7(y1), r2=99(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 7
LDI r2, 99
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
