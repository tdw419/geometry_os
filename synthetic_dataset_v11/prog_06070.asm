; DESCRIPTION: Draws a magenta line from (253, 104) to (194, 104).
; PLAN: r0=253(x1), r1=104(y1), r2=194(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 104
LDI r2, 194
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
