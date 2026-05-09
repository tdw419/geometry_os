; DESCRIPTION: Renders a purple line between points (42, 145) and (69, 40).
; PLAN: r0=42(x1), r1=145(y1), r2=69(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 145
LDI r2, 69
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
