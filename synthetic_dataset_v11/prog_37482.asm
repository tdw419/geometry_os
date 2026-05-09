; DESCRIPTION: Renders a purple line between points (242, 224) and (98, 81).
; PLAN: r0=242(x1), r1=224(y1), r2=98(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 224
LDI r2, 98
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
