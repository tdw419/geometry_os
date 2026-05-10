; DESCRIPTION: Draws a magenta line from (179, 29) to (203, 186).
; PLAN: r0=179(x1), r1=29(y1), r2=203(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 29
LDI r2, 203
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
