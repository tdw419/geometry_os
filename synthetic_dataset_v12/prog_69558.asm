; DESCRIPTION: Composite: Places a orange 59x54 rectangle at position (122, 114) then Draws a black circle centered at (305, 154) with radius 14.
; PLAN: r0=122(x), r1=114(y), r2=59(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=305(x), r6=154(y), r7=14(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 122
LDI r1, 114
LDI r2, 59
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 154
LDI r7, 14
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
