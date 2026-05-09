; DESCRIPTION: Draws a magenta line from (246, 255) to (216, 1).
; PLAN: r0=246(x1), r1=255(y1), r2=216(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 255
LDI r2, 216
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
