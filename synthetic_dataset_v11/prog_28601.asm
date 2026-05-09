; DESCRIPTION: Renders a blue line between points (161, 68) and (109, 162).
; PLAN: r0=161(x1), r1=68(y1), r2=109(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 68
LDI r2, 109
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
