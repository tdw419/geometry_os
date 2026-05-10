; DESCRIPTION: Composite: Creates a purple circular shape at (289, 180) with radius 30 then Renders a red box of size 98x83 starting at (40, 162).
; PLAN: r0=289(x), r1=180(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=40(x), r6=162(y), r7=98(width), r8=83(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 180
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 40
LDI r6, 162
LDI r7, 98
LDI r8, 83
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
