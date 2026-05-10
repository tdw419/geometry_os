; DESCRIPTION: Draws a magenta line from (447, 122) to (312, 218).
; PLAN: r0=447(x1), r1=122(y1), r2=312(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 122
LDI r2, 312
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
