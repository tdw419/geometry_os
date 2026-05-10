; DESCRIPTION: Draws a purple line from (504, 148) to (6, 199).
; PLAN: r0=504(x1), r1=148(y1), r2=6(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 148
LDI r2, 6
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
