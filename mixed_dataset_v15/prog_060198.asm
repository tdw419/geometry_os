; DESCRIPTION: Renders a purple line segment connecting (117, 185) to (42, 168).
; PLAN: r0=117(x1), r1=185(y1), r2=42(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 185
LDI r2, 42
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
