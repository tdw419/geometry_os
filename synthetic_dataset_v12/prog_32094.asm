; DESCRIPTION: Composite: Creates a orange circular shape at (421, 124) with radius 49 then Renders a green box of size 119x61 starting at (250, 17).
; PLAN: r0=421(x), r1=124(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x), r6=17(y), r7=119(width), r8=61(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 421
LDI r1, 124
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 17
LDI r7, 119
LDI r8, 61
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
