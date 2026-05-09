; DESCRIPTION: Renders a red line between points (121, 108) and (84, 122).
; PLAN: r0=121(x1), r1=108(y1), r2=84(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 108
LDI r2, 84
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
