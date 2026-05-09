; DESCRIPTION: Renders a purple line between points (166, 93) and (59, 62).
; PLAN: r0=166(x1), r1=93(y1), r2=59(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 93
LDI r2, 59
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
