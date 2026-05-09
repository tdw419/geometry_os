; DESCRIPTION: Composite: Places a magenta dot at position (49, 1) then Creates a white circular shape at (330, 108) with radius 72 then Places a magenta 18x75 rectangle at position (230, 151).
; PLAN: r0=49(x), r1=1(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=330(x), r6=108(y), r7=72(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=230(x), r11=151(y), r12=18(width), r13=75(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 1
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 330
LDI r6, 108
LDI r7, 72
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 230
LDI r11, 151
LDI r12, 18
LDI r13, 75
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
