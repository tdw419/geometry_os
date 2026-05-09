; DESCRIPTION: Composite: Creates a white circular shape at (363, 132) with radius 78 then Places a blue 12x28 rectangle at position (124, 80).
; PLAN: r0=363(x), r1=132(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x), r6=80(y), r7=12(width), r8=28(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 132
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 80
LDI r7, 12
LDI r8, 28
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
