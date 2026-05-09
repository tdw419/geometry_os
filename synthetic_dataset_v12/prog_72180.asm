; DESCRIPTION: Composite: Draws a white circle centered at (471, 90) with radius 36 then Places a cyan 40x85 rectangle at position (65, 9).
; PLAN: r0=471(x), r1=90(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=65(x), r6=9(y), r7=40(width), r8=85(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 471
LDI r1, 90
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 65
LDI r6, 9
LDI r7, 40
LDI r8, 85
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
