; DESCRIPTION: Renders a green line between points (136, 86) and (270, 50).
; PLAN: r0=136(x1), r1=86(y1), r2=270(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 86
LDI r2, 270
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
