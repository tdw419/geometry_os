; DESCRIPTION: Draws a magenta line from (274, 179) to (8, 122).
; PLAN: r0=274(x1), r1=179(y1), r2=8(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 179
LDI r2, 8
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
