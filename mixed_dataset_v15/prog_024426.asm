; DESCRIPTION: Composite: Renders a orange line between points (379, 194) and (507, 128) then Creates a black circular shape at (460, 98) with radius 28.
; PLAN: r0=379(x1), r1=194(y1), r2=507(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=460(x), r6=98(y), r7=28(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 379
LDI r1, 194
LDI r2, 507
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 98
LDI r7, 28
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
