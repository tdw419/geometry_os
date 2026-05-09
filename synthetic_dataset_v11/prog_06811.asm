; DESCRIPTION: Draws a purple line from (7, 191) to (38, 32).
; PLAN: r0=7(x1), r1=191(y1), r2=38(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 191
LDI r2, 38
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
