; DESCRIPTION: Renders a green line between points (211, 245) and (109, 192).
; PLAN: r0=211(x1), r1=245(y1), r2=109(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 245
LDI r2, 109
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
