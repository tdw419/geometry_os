; DESCRIPTION: Composite: Renders a cyan box of size 113x35 starting at (49, 14) then Creates a cyan circular shape at (395, 75) with radius 52.
; PLAN: r0=49(x), r1=14(y), r2=113(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=395(x), r6=75(y), r7=52(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 49
LDI r1, 14
LDI r2, 113
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 75
LDI r7, 52
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
