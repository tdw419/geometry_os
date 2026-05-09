; DESCRIPTION: Renders a red line between points (82, 100) and (63, 248).
; PLAN: r0=82(x1), r1=100(y1), r2=63(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 100
LDI r2, 63
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
