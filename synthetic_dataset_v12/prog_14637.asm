; DESCRIPTION: Draws a yellow line from (70, 247) to (427, 216).
; PLAN: r0=70(x1), r1=247(y1), r2=427(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 247
LDI r2, 427
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
