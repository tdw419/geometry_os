; DESCRIPTION: Draws a purple line from (232, 65) to (27, 109).
; PLAN: r0=232(x1), r1=65(y1), r2=27(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 65
LDI r2, 27
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
