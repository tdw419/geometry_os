; DESCRIPTION: Draws a magenta line from (15, 97) to (11, 104).
; PLAN: r0=15(x1), r1=97(y1), r2=11(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 97
LDI r2, 11
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
