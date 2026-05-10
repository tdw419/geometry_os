; DESCRIPTION: Draws a magenta line from (319, 8) to (282, 34).
; PLAN: r0=319(x1), r1=8(y1), r2=282(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 8
LDI r2, 282
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
