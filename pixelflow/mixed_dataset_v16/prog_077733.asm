; DESCRIPTION: Composite: Places a yellow dot at position (72, 3) then Creates a white circular shape at (297, 75) with radius 73 then Draws a red rectangle at (58, 106) with width 90 and height 100.
; PLAN: r0=72(x), r1=3(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=297(x), r6=75(y), r7=73(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=58(x), r11=106(y), r12=90(width), r13=100(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 72
LDI r1, 3
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 297
LDI r6, 75
LDI r7, 73
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 58
LDI r11, 106
LDI r12, 90
LDI r13, 100
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
