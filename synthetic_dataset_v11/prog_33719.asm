; DESCRIPTION: Renders a green line between points (192, 163) and (130, 135).
; PLAN: r0=192(x1), r1=163(y1), r2=130(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 163
LDI r2, 130
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
