; DESCRIPTION: Renders a purple line between points (452, 134) and (156, 68).
; PLAN: r0=452(x1), r1=134(y1), r2=156(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 134
LDI r2, 156
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
