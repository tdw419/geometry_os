; DESCRIPTION: Places a purple line segment connecting (161, 110) to (42, 182).
; PLAN: r0=161(x1), r1=110(y1), r2=42(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 110
LDI r2, 42
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
