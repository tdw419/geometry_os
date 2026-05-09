; DESCRIPTION: Renders a magenta line between points (236, 246) and (11, 73).
; PLAN: r0=236(x1), r1=246(y1), r2=11(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 246
LDI r2, 11
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
