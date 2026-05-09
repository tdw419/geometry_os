; DESCRIPTION: Draws a magenta line from (8, 199) to (262, 232).
; PLAN: r0=8(x1), r1=199(y1), r2=262(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 199
LDI r2, 262
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
