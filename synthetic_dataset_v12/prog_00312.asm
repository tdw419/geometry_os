; DESCRIPTION: Places a purple line segment connecting (473, 138) to (469, 42).
; PLAN: r0=473(x1), r1=138(y1), r2=469(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 138
LDI r2, 469
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
