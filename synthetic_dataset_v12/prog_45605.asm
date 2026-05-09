; DESCRIPTION: Draws a yellow line from (369, 118) to (148, 146).
; PLAN: r0=369(x1), r1=118(y1), r2=148(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 118
LDI r2, 148
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
