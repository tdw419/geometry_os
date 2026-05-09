; DESCRIPTION: Composite: Places a blue 90x17 rectangle at position (230, 9) then Creates a green circular shape at (248, 68) with radius 15.
; PLAN: r0=230(x), r1=9(y), r2=90(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x), r6=68(y), r7=15(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 230
LDI r1, 9
LDI r2, 90
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 68
LDI r7, 15
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
