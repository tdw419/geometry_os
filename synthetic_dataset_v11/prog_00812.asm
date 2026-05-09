; DESCRIPTION: Renders a purple line between points (242, 224) and (211, 180).
; PLAN: r0=242(x1), r1=224(y1), r2=211(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 224
LDI r2, 211
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
