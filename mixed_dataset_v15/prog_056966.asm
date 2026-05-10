; DESCRIPTION: Renders a magenta line between points (246, 246) and (498, 244).
; PLAN: r0=246(x1), r1=246(y1), r2=498(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 246
LDI r2, 498
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
