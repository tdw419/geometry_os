; DESCRIPTION: Places a purple line segment connecting (293, 150) to (100, 214).
; PLAN: r0=293(x1), r1=150(y1), r2=100(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 150
LDI r2, 100
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
