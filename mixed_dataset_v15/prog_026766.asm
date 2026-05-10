; DESCRIPTION: Draws a yellow line from (311, 183) to (222, 93).
; PLAN: r0=311(x1), r1=183(y1), r2=222(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 183
LDI r2, 222
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
