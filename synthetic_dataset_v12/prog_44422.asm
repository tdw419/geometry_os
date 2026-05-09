; DESCRIPTION: Composite: Places a cyan 45x57 rectangle at position (328, 33) then Creates a yellow circular shape at (291, 137) with radius 68.
; PLAN: r0=328(x), r1=33(y), r2=45(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x), r6=137(y), r7=68(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 328
LDI r1, 33
LDI r2, 45
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 137
LDI r7, 68
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
