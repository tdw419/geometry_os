; DESCRIPTION: Renders a yellow line between points (86, 247) and (57, 162).
; PLAN: r0=86(x1), r1=247(y1), r2=57(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 247
LDI r2, 57
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
