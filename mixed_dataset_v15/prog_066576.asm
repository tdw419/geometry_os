; DESCRIPTION: Composite: Places a magenta 59x61 rectangle at position (105, 124) then Draws a black circle centered at (83, 154) with radius 67.
; PLAN: r0=105(x), r1=124(y), r2=59(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=83(x), r6=154(y), r7=67(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 105
LDI r1, 124
LDI r2, 59
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 154
LDI r7, 67
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
