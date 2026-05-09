; DESCRIPTION: Draws a yellow line from (101, 125) to (34, 132).
; PLAN: r0=101(x1), r1=125(y1), r2=34(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 125
LDI r2, 34
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
