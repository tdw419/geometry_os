; DESCRIPTION: Draws a magenta line from (413, 88) to (246, 91).
; PLAN: r0=413(x1), r1=88(y1), r2=246(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 88
LDI r2, 246
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
