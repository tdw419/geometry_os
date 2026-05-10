; DESCRIPTION: Draws a purple line from (407, 124) to (278, 18).
; PLAN: r0=407(x1), r1=124(y1), r2=278(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 124
LDI r2, 278
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
