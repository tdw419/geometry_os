; DESCRIPTION: Renders a magenta line between points (228, 11) and (335, 79).
; PLAN: r0=228(x1), r1=11(y1), r2=335(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 11
LDI r2, 335
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
