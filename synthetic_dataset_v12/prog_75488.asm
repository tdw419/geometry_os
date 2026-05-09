; DESCRIPTION: Composite: Places a black circle of radius 55 at center (62, 141) then Places a magenta 13x69 rectangle at position (361, 89).
; PLAN: r0=62(x), r1=141(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=361(x), r6=89(y), r7=13(width), r8=69(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 62
LDI r1, 141
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 361
LDI r6, 89
LDI r7, 13
LDI r8, 69
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
