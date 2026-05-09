; DESCRIPTION: Renders a green line between points (234, 208) and (347, 245).
; PLAN: r0=234(x1), r1=208(y1), r2=347(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 208
LDI r2, 347
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
