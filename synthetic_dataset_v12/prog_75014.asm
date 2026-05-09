; DESCRIPTION: Composite: Renders a blue box of size 59x68 starting at (58, 59) then Draws a black circle centered at (354, 68) with radius 24.
; PLAN: r0=58(x), r1=59(y), r2=59(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=354(x), r6=68(y), r7=24(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 58
LDI r1, 59
LDI r2, 59
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 68
LDI r7, 24
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
