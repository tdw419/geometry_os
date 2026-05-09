; DESCRIPTION: Renders a green line between points (192, 172) and (14, 87).
; PLAN: r0=192(x1), r1=172(y1), r2=14(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 172
LDI r2, 14
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
