; DESCRIPTION: Composite: Creates a white circular shape at (442, 50) with radius 29 then Places a black dot at position (134, 97) then Renders a red box of size 95x36 starting at (376, 154).
; PLAN: r0=442(x), r1=50(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=134(x), r6=97(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=376(x), r11=154(y), r12=95(width), r13=36(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 442
LDI r1, 50
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 134
LDI r6, 97
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 376
LDI r11, 154
LDI r12, 95
LDI r13, 36
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
