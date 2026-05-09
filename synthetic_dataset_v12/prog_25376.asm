; DESCRIPTION: Composite: Draws a red circle centered at (74, 179) with radius 18 then Places a green 88x59 rectangle at position (360, 9).
; PLAN: r0=74(x), r1=179(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x), r6=9(y), r7=88(width), r8=59(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 74
LDI r1, 179
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 9
LDI r7, 88
LDI r8, 59
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
