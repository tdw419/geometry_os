; DESCRIPTION: Composite: Draws a white circle centered at (419, 34) with radius 29 then Places a red 34x14 rectangle at position (278, 33).
; PLAN: r0=419(x), r1=34(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x), r6=33(y), r7=34(width), r8=14(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 34
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 33
LDI r7, 34
LDI r8, 14
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
