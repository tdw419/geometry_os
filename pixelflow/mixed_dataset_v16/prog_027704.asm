; DESCRIPTION: Draws a magenta line from (35, 92) to (208, 203).
; PLAN: r0=35(x1), r1=92(y1), r2=208(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 92
LDI r2, 208
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
