; DESCRIPTION: Draws a blue line from (218, 56) to (251, 1).
; PLAN: r0=218(x1), r1=56(y1), r2=251(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 56
LDI r2, 251
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
