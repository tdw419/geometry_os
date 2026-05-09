; DESCRIPTION: Places a purple line segment connecting (228, 13) to (161, 76).
; PLAN: r0=228(x1), r1=13(y1), r2=161(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 13
LDI r2, 161
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
