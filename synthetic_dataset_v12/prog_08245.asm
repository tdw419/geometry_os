; DESCRIPTION: Draws a magenta line from (112, 166) to (268, 104).
; PLAN: r0=112(x1), r1=166(y1), r2=268(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 166
LDI r2, 268
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
