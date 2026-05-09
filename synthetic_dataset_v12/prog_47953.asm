; DESCRIPTION: Draws a purple line from (337, 44) to (388, 253).
; PLAN: r0=337(x1), r1=44(y1), r2=388(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 44
LDI r2, 388
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
