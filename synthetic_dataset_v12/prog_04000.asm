; DESCRIPTION: Renders a orange line between points (412, 136) and (220, 205).
; PLAN: r0=412(x1), r1=136(y1), r2=220(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 136
LDI r2, 220
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
