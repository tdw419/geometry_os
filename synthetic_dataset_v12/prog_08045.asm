; DESCRIPTION: Renders a purple line between points (128, 110) and (401, 191).
; PLAN: r0=128(x1), r1=110(y1), r2=401(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 110
LDI r2, 401
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
