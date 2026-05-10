; DESCRIPTION: Renders a green line between points (351, 98) and (144, 30).
; PLAN: r0=351(x1), r1=98(y1), r2=144(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 98
LDI r2, 144
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
