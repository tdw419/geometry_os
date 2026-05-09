; DESCRIPTION: Renders a orange line between points (231, 69) and (240, 102).
; PLAN: r0=231(x1), r1=69(y1), r2=240(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 69
LDI r2, 240
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
