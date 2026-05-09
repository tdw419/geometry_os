; DESCRIPTION: Places a purple line segment connecting (107, 161) to (394, 214).
; PLAN: r0=107(x1), r1=161(y1), r2=394(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 161
LDI r2, 394
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
