; DESCRIPTION: Renders a magenta line between points (133, 228) and (76, 100).
; PLAN: r0=133(x1), r1=228(y1), r2=76(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 228
LDI r2, 76
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
