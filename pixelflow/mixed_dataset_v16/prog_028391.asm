; DESCRIPTION: Composite: Draws a cyan circle centered at (291, 22) with radius 19 then Places a purple 90x89 rectangle at position (287, 20).
; PLAN: r0=291(x), r1=22(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=287(x), r6=20(y), r7=90(width), r8=89(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 22
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 287
LDI r6, 20
LDI r7, 90
LDI r8, 89
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
