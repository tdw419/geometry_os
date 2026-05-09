; DESCRIPTION: Renders a red line between points (84, 59) and (161, 212).
; PLAN: r0=84(x1), r1=59(y1), r2=161(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 59
LDI r2, 161
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
