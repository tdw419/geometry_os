; DESCRIPTION: Composite: Draws a cyan circle centered at (163, 219) with radius 13 then Renders a cyan box of size 104x101 starting at (327, 29).
; PLAN: r0=163(x), r1=219(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=327(x), r6=29(y), r7=104(width), r8=101(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 163
LDI r1, 219
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 327
LDI r6, 29
LDI r7, 104
LDI r8, 101
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
