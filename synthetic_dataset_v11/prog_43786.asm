; DESCRIPTION: Draws a purple line from (58, 65) to (98, 24).
; PLAN: r0=58(x1), r1=65(y1), r2=98(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 65
LDI r2, 98
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
