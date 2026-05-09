; DESCRIPTION: Places a purple line segment connecting (42, 161) to (157, 191).
; PLAN: r0=42(x1), r1=161(y1), r2=157(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 161
LDI r2, 157
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
