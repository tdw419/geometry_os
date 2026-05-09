; DESCRIPTION: Composite: Draws a red rectangle at (360, 133) with width 65 and height 21 then Draws a black circle centered at (124, 207) with radius 15.
; PLAN: r0=360(x), r1=133(y), r2=65(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=124(x), r6=207(y), r7=15(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 360
LDI r1, 133
LDI r2, 65
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 207
LDI r7, 15
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
