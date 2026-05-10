; DESCRIPTION: Draws a yellow line from (283, 99) to (79, 118).
; PLAN: r0=283(x1), r1=99(y1), r2=79(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 99
LDI r2, 79
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
