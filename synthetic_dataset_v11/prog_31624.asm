; DESCRIPTION: Renders a green line between points (208, 163) and (26, 184).
; PLAN: r0=208(x1), r1=163(y1), r2=26(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 163
LDI r2, 26
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
