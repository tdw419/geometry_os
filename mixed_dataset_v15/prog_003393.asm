; DESCRIPTION: Draws a purple line from (376, 19) to (275, 101).
; PLAN: r0=376(x1), r1=19(y1), r2=275(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 19
LDI r2, 275
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
