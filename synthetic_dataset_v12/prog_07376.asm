; DESCRIPTION: Composite: Renders a red box of size 46x13 starting at (286, 160) then Creates a white circular shape at (287, 179) with radius 33.
; PLAN: r0=286(x), r1=160(y), r2=46(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=287(x), r6=179(y), r7=33(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 286
LDI r1, 160
LDI r2, 46
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 179
LDI r7, 33
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
