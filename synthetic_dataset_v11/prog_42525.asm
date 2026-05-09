; DESCRIPTION: Draws a purple line from (94, 165) to (83, 253).
; PLAN: r0=94(x1), r1=165(y1), r2=83(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 165
LDI r2, 83
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
