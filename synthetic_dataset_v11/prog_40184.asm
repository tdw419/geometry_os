; DESCRIPTION: Draws a yellow line from (233, 183) to (148, 168).
; PLAN: r0=233(x1), r1=183(y1), r2=148(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 183
LDI r2, 148
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
