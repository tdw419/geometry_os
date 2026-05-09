; DESCRIPTION: Composite: Places a white 118x27 rectangle at position (131, 139) then Creates a blue circular shape at (352, 83) with radius 75.
; PLAN: r0=131(x), r1=139(y), r2=118(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=352(x), r6=83(y), r7=75(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 131
LDI r1, 139
LDI r2, 118
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 83
LDI r7, 75
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
