; DESCRIPTION: Composite: Places a purple circle of radius 20 at center (64, 35) then Places a yellow 77x104 rectangle at position (45, 140).
; PLAN: r0=64(x), r1=35(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x), r6=140(y), r7=77(width), r8=104(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 64
LDI r1, 35
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 140
LDI r7, 77
LDI r8, 104
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
