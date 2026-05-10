; DESCRIPTION: Draws a purple line from (130, 177) to (319, 68).
; PLAN: r0=130(x1), r1=177(y1), r2=319(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 177
LDI r2, 319
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
