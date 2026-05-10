; DESCRIPTION: Composite: Places a cyan 66x13 rectangle at position (141, 189) then Draws a black circle centered at (312, 62) with radius 46.
; PLAN: r0=141(x), r1=189(y), r2=66(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=312(x), r6=62(y), r7=46(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 141
LDI r1, 189
LDI r2, 66
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 62
LDI r7, 46
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
