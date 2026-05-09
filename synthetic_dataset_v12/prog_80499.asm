; DESCRIPTION: Draws a magenta line from (157, 222) to (490, 91).
; PLAN: r0=157(x1), r1=222(y1), r2=490(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 222
LDI r2, 490
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
