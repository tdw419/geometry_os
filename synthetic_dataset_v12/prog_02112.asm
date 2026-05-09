; DESCRIPTION: Renders a yellow line between points (92, 68) and (153, 140).
; PLAN: r0=92(x1), r1=68(y1), r2=153(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 68
LDI r2, 153
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
