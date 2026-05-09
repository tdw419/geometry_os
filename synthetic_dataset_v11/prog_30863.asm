; DESCRIPTION: Places a purple line segment connecting (128, 124) to (152, 41).
; PLAN: r0=128(x1), r1=124(y1), r2=152(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 124
LDI r2, 152
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
