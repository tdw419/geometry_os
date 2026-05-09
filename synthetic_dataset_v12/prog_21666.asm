; DESCRIPTION: Renders a green line between points (201, 49) and (239, 199).
; PLAN: r0=201(x1), r1=49(y1), r2=239(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 49
LDI r2, 239
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
