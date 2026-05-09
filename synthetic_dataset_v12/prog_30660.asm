; DESCRIPTION: Draws a purple line from (495, 191) to (299, 134).
; PLAN: r0=495(x1), r1=191(y1), r2=299(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 191
LDI r2, 299
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
