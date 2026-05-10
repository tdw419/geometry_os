; DESCRIPTION: Renders a red line segment connecting (117, 108) to (47, 181).
; PLAN: r0=117(x1), r1=108(y1), r2=47(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 108
LDI r2, 47
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
