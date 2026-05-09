; DESCRIPTION: Draws a yellow line from (158, 90) to (168, 92).
; PLAN: r0=158(x1), r1=90(y1), r2=168(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 90
LDI r2, 168
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
