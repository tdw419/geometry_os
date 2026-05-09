; DESCRIPTION: Renders a blue line between points (252, 80) and (166, 153).
; PLAN: r0=252(x1), r1=80(y1), r2=166(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 80
LDI r2, 166
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
