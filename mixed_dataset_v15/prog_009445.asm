; DESCRIPTION: Draws a purple line from (144, 86) to (319, 39).
; PLAN: r0=144(x1), r1=86(y1), r2=319(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 86
LDI r2, 319
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
