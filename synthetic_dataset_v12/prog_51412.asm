; DESCRIPTION: Draws a purple line from (218, 251) to (54, 196).
; PLAN: r0=218(x1), r1=251(y1), r2=54(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 251
LDI r2, 54
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
