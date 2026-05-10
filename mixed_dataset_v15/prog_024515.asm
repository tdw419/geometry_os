; DESCRIPTION: Composite: Places a white dot at position (28, 2) then Places a red circle of radius 68 at center (105, 162) then Draws a purple rectangle at (370, 221) with width 68 and height 31.
; PLAN: r0=28(x), r1=2(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=105(x), r6=162(y), r7=68(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=370(x), r11=221(y), r12=68(width), r13=31(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 28
LDI r1, 2
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 105
LDI r6, 162
LDI r7, 68
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 370
LDI r11, 221
LDI r12, 68
LDI r13, 31
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
