; DESCRIPTION: Draws a purple line from (163, 173) to (9, 14).
; PLAN: r0=163(x1), r1=173(y1), r2=9(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 173
LDI r2, 9
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
