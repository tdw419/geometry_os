; DESCRIPTION: Renders a blue line between points (123, 68) and (15, 93).
; PLAN: r0=123(x1), r1=68(y1), r2=15(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 68
LDI r2, 15
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
