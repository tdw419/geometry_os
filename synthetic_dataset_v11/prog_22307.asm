; DESCRIPTION: Renders a green line between points (163, 208) and (166, 183).
; PLAN: r0=163(x1), r1=208(y1), r2=166(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 208
LDI r2, 166
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
