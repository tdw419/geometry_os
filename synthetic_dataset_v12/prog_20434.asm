; DESCRIPTION: Composite: Places a black line segment connecting (481, 86) to (212, 30) then Renders a green disk with center (142, 76) and radius 71.
; PLAN: r0=481(x1), r1=86(y1), r2=212(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=142(x), r6=76(y), r7=71(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 481
LDI r1, 86
LDI r2, 212
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 76
LDI r7, 71
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
