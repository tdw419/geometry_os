; DESCRIPTION: Renders a magenta line between points (6, 228) and (116, 214).
; PLAN: r0=6(x1), r1=228(y1), r2=116(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 228
LDI r2, 116
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
