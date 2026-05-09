; DESCRIPTION: Renders a green line between points (136, 8) and (24, 70).
; PLAN: r0=136(x1), r1=8(y1), r2=24(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 8
LDI r2, 24
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
