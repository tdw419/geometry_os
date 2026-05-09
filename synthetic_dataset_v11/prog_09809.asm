; DESCRIPTION: Draws a yellow line from (15, 125) to (226, 123).
; PLAN: r0=15(x1), r1=125(y1), r2=226(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 125
LDI r2, 226
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
