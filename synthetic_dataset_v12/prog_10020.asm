; DESCRIPTION: Renders a green line between points (24, 126) and (71, 147).
; PLAN: r0=24(x1), r1=126(y1), r2=71(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 126
LDI r2, 71
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
