; DESCRIPTION: Draws a purple line from (71, 19) to (388, 108).
; PLAN: r0=71(x1), r1=19(y1), r2=388(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 19
LDI r2, 388
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
