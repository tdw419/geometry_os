; DESCRIPTION: Composite: Renders a yellow box of size 119x120 starting at (76, 81) then Creates a black circular shape at (198, 82) with radius 36.
; PLAN: r0=76(x), r1=81(y), r2=119(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x), r6=82(y), r7=36(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 76
LDI r1, 81
LDI r2, 119
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 82
LDI r7, 36
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
