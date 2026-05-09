; DESCRIPTION: Places a purple line segment connecting (164, 176) to (293, 60).
; PLAN: r0=164(x1), r1=176(y1), r2=293(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 176
LDI r2, 293
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
