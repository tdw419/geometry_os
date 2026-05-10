; DESCRIPTION: Composite: Renders a black line between points (160, 143) and (197, 83) then Creates a orange circular shape at (76, 209) with radius 30.
; PLAN: r0=160(x1), r1=143(y1), r2=197(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=76(x), r6=209(y), r7=30(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 160
LDI r1, 143
LDI r2, 197
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 209
LDI r7, 30
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
