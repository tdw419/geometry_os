; DESCRIPTION: Draws a magenta line from (319, 208) to (324, 3).
; PLAN: r0=319(x1), r1=208(y1), r2=324(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 208
LDI r2, 324
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
