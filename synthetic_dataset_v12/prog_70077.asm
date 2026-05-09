; DESCRIPTION: Renders a magenta line between points (335, 189) and (246, 150).
; PLAN: r0=335(x1), r1=189(y1), r2=246(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 189
LDI r2, 246
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
