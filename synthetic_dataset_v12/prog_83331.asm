; DESCRIPTION: Composite: Renders a red box of size 42x93 starting at (372, 146) then Creates a white circular shape at (449, 34) with radius 18.
; PLAN: r0=372(x), r1=146(y), r2=42(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=449(x), r6=34(y), r7=18(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 372
LDI r1, 146
LDI r2, 42
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 34
LDI r7, 18
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
