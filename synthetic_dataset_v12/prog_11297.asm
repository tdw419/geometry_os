; DESCRIPTION: Renders a purple line between points (205, 18) and (69, 137).
; PLAN: r0=205(x1), r1=18(y1), r2=69(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 18
LDI r2, 69
LDI r3, 137
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
