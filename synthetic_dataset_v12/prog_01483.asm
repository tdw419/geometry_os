; DESCRIPTION: Renders a green line between points (212, 85) and (136, 167).
; PLAN: r0=212(x1), r1=85(y1), r2=136(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 85
LDI r2, 136
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
