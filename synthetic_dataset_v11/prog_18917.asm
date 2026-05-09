; DESCRIPTION: Draws a magenta line from (246, 206) to (167, 191).
; PLAN: r0=246(x1), r1=206(y1), r2=167(x2), r3=191(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 206
LDI r2, 167
LDI r3, 191
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
