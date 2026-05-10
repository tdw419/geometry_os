; DESCRIPTION: Draws a magenta line from (68, 5) to (246, 11).
; PLAN: r0=68(x1), r1=5(y1), r2=246(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 5
LDI r2, 246
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
