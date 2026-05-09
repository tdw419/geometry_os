; DESCRIPTION: Composite: Renders a white line between points (419, 48) and (122, 243) then Creates a yellow circular shape at (119, 209) with radius 29.
; PLAN: r0=419(x1), r1=48(y1), r2=122(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=209(y), r7=29(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 419
LDI r1, 48
LDI r2, 122
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 209
LDI r7, 29
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
