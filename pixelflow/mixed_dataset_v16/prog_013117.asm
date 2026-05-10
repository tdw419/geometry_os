; DESCRIPTION: Composite: Creates a blue circular shape at (356, 135) with radius 75 then Renders a cyan box of size 78x119 starting at (373, 35).
; PLAN: r0=356(x), r1=135(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=373(x), r6=35(y), r7=78(width), r8=119(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 135
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 373
LDI r6, 35
LDI r7, 78
LDI r8, 119
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
