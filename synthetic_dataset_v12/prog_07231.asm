; DESCRIPTION: Draws a magenta line from (379, 63) to (238, 179).
; PLAN: r0=379(x1), r1=63(y1), r2=238(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 63
LDI r2, 238
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
