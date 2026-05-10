; DESCRIPTION: Draws a purple line from (373, 225) to (12, 23).
; PLAN: r0=373(x1), r1=225(y1), r2=12(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 225
LDI r2, 12
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
