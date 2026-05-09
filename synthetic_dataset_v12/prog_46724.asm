; DESCRIPTION: Renders a green line between points (68, 240) and (388, 252).
; PLAN: r0=68(x1), r1=240(y1), r2=388(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 240
LDI r2, 388
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
