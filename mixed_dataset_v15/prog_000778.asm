; DESCRIPTION: Draws a magenta line from (116, 125) to (119, 129).
; PLAN: r0=116(x1), r1=125(y1), r2=119(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 125
LDI r2, 119
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
