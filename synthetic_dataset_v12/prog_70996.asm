; DESCRIPTION: Places a purple line segment connecting (467, 185) to (1, 210).
; PLAN: r0=467(x1), r1=185(y1), r2=1(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 185
LDI r2, 1
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
