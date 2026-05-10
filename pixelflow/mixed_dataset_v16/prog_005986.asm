; DESCRIPTION: Draws a purple line from (475, 129) to (247, 2).
; PLAN: r0=475(x1), r1=129(y1), r2=247(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 129
LDI r2, 247
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
