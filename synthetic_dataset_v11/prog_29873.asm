; DESCRIPTION: Places a purple line segment connecting (215, 72) to (241, 233).
; PLAN: r0=215(x1), r1=72(y1), r2=241(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 72
LDI r2, 241
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
