; DESCRIPTION: Places a purple line segment connecting (256, 61) to (16, 214).
; PLAN: r0=256(x1), r1=61(y1), r2=16(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 61
LDI r2, 16
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
