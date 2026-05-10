; DESCRIPTION: Draws a magenta line from (319, 118) to (256, 20).
; PLAN: r0=319(x1), r1=118(y1), r2=256(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 118
LDI r2, 256
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
