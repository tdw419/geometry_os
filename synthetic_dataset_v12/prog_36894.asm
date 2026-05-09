; DESCRIPTION: Composite: Creates a black circular shape at (461, 115) with radius 49 then Renders a red box of size 35x68 starting at (349, 53).
; PLAN: r0=461(x), r1=115(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x), r6=53(y), r7=35(width), r8=68(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 461
LDI r1, 115
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 53
LDI r7, 35
LDI r8, 68
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
