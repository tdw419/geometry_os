; DESCRIPTION: Renders a blue line between points (88, 62) and (366, 228).
; PLAN: r0=88(x1), r1=62(y1), r2=366(x2), r3=228(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 62
LDI r2, 366
LDI r3, 228
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
