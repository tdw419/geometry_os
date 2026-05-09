; DESCRIPTION: Renders a green line between points (92, 117) and (136, 189).
; PLAN: r0=92(x1), r1=117(y1), r2=136(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 117
LDI r2, 136
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
