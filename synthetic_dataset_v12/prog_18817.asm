; DESCRIPTION: Draws a purple line from (264, 28) to (418, 240).
; PLAN: r0=264(x1), r1=28(y1), r2=418(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 28
LDI r2, 418
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
