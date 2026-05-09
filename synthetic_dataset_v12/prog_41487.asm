; DESCRIPTION: Composite: Places a yellow 86x54 rectangle at position (397, 119) then Creates a green circular shape at (327, 58) with radius 49.
; PLAN: r0=397(x), r1=119(y), r2=86(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x), r6=58(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 397
LDI r1, 119
LDI r2, 86
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 58
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
