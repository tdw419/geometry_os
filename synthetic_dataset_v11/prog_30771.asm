; DESCRIPTION: Renders a green line between points (118, 219) and (192, 246).
; PLAN: r0=118(x1), r1=219(y1), r2=192(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 219
LDI r2, 192
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
