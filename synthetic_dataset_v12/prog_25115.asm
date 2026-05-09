; DESCRIPTION: Draws a purple line from (298, 181) to (414, 218).
; PLAN: r0=298(x1), r1=181(y1), r2=414(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 181
LDI r2, 414
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
