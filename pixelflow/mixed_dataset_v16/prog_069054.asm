; DESCRIPTION: Places a purple line segment connecting (401, 19) to (252, 95).
; PLAN: r0=401(x1), r1=19(y1), r2=252(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 19
LDI r2, 252
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
