; DESCRIPTION: Renders a red line between points (427, 246) and (63, 61).
; PLAN: r0=427(x1), r1=246(y1), r2=63(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 246
LDI r2, 63
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
