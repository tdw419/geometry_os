; DESCRIPTION: Renders a blue line between points (212, 7) and (161, 102).
; PLAN: r0=212(x1), r1=7(y1), r2=161(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 7
LDI r2, 161
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
