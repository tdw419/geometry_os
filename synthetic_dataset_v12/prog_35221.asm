; DESCRIPTION: Draws a magenta line from (300, 64) to (319, 245).
; PLAN: r0=300(x1), r1=64(y1), r2=319(x2), r3=245(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 64
LDI r2, 319
LDI r3, 245
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
