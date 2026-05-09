; DESCRIPTION: Renders a purple line between points (168, 246) and (93, 228).
; PLAN: r0=168(x1), r1=246(y1), r2=93(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 246
LDI r2, 93
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
