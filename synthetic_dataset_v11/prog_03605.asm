; DESCRIPTION: Renders a purple line between points (31, 62) and (42, 186).
; PLAN: r0=31(x1), r1=62(y1), r2=42(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 62
LDI r2, 42
LDI r3, 186
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
