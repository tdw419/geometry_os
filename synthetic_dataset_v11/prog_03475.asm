; DESCRIPTION: Draws a purple line from (131, 70) to (218, 160).
; PLAN: r0=131(x1), r1=70(y1), r2=218(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 70
LDI r2, 218
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
