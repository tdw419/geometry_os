; DESCRIPTION: Draws a magenta line from (79, 203) to (48, 129).
; PLAN: r0=79(x1), r1=203(y1), r2=48(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 203
LDI r2, 48
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
