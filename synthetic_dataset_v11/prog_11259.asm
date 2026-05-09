; DESCRIPTION: Renders a magenta line between points (246, 161) and (245, 82).
; PLAN: r0=246(x1), r1=161(y1), r2=245(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 161
LDI r2, 245
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
