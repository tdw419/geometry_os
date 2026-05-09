; DESCRIPTION: Renders a green line between points (274, 37) and (417, 9).
; PLAN: r0=274(x1), r1=37(y1), r2=417(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 37
LDI r2, 417
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
