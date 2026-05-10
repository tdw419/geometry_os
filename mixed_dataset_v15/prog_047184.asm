; DESCRIPTION: Composite: Places a black dot at position (467, 138) then Draws a cyan circle centered at (67, 195) with radius 59 then Draws a green rectangle at (214, 139) with width 99 and height 107.
; PLAN: r0=467(x), r1=138(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=67(x), r6=195(y), r7=59(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=214(x), r11=139(y), r12=99(width), r13=107(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 467
LDI r1, 138
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 67
LDI r6, 195
LDI r7, 59
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 214
LDI r11, 139
LDI r12, 99
LDI r13, 107
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
