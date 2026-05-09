; DESCRIPTION: Places a blue line segment connecting (467, 42) to (501, 217).
; PLAN: r0=467(x1), r1=42(y1), r2=501(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 42
LDI r2, 501
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
