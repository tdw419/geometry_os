; DESCRIPTION: Renders a green line between points (158, 64) and (451, 252).
; PLAN: r0=158(x1), r1=64(y1), r2=451(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 64
LDI r2, 451
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
