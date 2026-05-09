; DESCRIPTION: Draws a purple line from (271, 46) to (319, 66).
; PLAN: r0=271(x1), r1=46(y1), r2=319(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 46
LDI r2, 319
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
