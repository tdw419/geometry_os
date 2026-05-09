; DESCRIPTION: Renders a green line between points (69, 1) and (222, 205).
; PLAN: r0=69(x1), r1=1(y1), r2=222(x2), r3=205(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 1
LDI r2, 222
LDI r3, 205
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
