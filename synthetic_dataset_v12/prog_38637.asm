; DESCRIPTION: Places a purple line segment connecting (14, 39) to (312, 146).
; PLAN: r0=14(x1), r1=39(y1), r2=312(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 39
LDI r2, 312
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
