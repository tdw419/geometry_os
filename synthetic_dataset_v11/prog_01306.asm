; DESCRIPTION: Draws a magenta line from (28, 225) to (116, 158).
; PLAN: r0=28(x1), r1=225(y1), r2=116(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 225
LDI r2, 116
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
