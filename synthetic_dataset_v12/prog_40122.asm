; DESCRIPTION: Renders a yellow line between points (452, 216) and (68, 57).
; PLAN: r0=452(x1), r1=216(y1), r2=68(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 216
LDI r2, 68
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
