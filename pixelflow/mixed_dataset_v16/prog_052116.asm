; DESCRIPTION: Renders a yellow line between points (133, 247) and (123, 156).
; PLAN: r0=133(x1), r1=247(y1), r2=123(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 247
LDI r2, 123
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
