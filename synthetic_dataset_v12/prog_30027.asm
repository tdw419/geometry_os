; DESCRIPTION: Composite: Creates a green circular shape at (124, 93) with radius 64 then Renders a white box of size 89x64 starting at (421, 64).
; PLAN: r0=124(x), r1=93(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=421(x), r6=64(y), r7=89(width), r8=64(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 124
LDI r1, 93
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 421
LDI r6, 64
LDI r7, 89
LDI r8, 64
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
