; DESCRIPTION: Renders a yellow line between points (22, 245) and (181, 168).
; PLAN: r0=22(x1), r1=245(y1), r2=181(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 245
LDI r2, 181
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
