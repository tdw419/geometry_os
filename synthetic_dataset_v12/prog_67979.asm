; DESCRIPTION: Draws a purple line from (288, 75) to (391, 255).
; PLAN: r0=288(x1), r1=75(y1), r2=391(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 75
LDI r2, 391
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
