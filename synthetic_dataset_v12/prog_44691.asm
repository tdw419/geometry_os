; DESCRIPTION: Composite: Renders a blue line between points (25, 224) and (326, 137) then Renders a red disk with center (363, 219) and radius 29.
; PLAN: r0=25(x1), r1=224(y1), r2=326(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=219(y), r7=29(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 25
LDI r1, 224
LDI r2, 326
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 219
LDI r7, 29
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
