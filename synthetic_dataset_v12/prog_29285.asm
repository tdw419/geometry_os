; DESCRIPTION: Composite: Places a green 31x10 rectangle at position (406, 178) then Creates a black circular shape at (278, 207) with radius 45.
; PLAN: r0=406(x), r1=178(y), r2=31(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x), r6=207(y), r7=45(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 406
LDI r1, 178
LDI r2, 31
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 207
LDI r7, 45
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
