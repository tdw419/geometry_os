; DESCRIPTION: Renders a yellow line between points (117, 247) and (99, 36).
; PLAN: r0=117(x1), r1=247(y1), r2=99(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 247
LDI r2, 99
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
