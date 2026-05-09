; DESCRIPTION: Renders a yellow line between points (257, 154) and (192, 40).
; PLAN: r0=257(x1), r1=154(y1), r2=192(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 154
LDI r2, 192
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
