; DESCRIPTION: Places a purple line segment connecting (120, 215) to (45, 101).
; PLAN: r0=120(x1), r1=215(y1), r2=45(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 215
LDI r2, 45
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
