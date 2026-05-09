; DESCRIPTION: Draws a yellow line from (127, 165) to (68, 106).
; PLAN: r0=127(x1), r1=165(y1), r2=68(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 165
LDI r2, 68
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
