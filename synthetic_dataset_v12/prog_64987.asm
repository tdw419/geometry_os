; DESCRIPTION: Composite: Places a black dot at position (228, 45) then Creates a green circular shape at (413, 69) with radius 42 then Draws a yellow rectangle at (330, 18) with width 67 and height 116.
; PLAN: r0=228(x), r1=45(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=413(x), r6=69(y), r7=42(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=330(x), r11=18(y), r12=67(width), r13=116(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 228
LDI r1, 45
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 413
LDI r6, 69
LDI r7, 42
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 330
LDI r11, 18
LDI r12, 67
LDI r13, 116
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
