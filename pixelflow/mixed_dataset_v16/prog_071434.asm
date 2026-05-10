; DESCRIPTION: Composite: Places a black circle of radius 58 at center (163, 124) then Draws a red rectangle at (463, 6) with width 12 and height 92.
; PLAN: r0=163(x), r1=124(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=463(x), r6=6(y), r7=12(width), r8=92(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 163
LDI r1, 124
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 463
LDI r6, 6
LDI r7, 12
LDI r8, 92
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
