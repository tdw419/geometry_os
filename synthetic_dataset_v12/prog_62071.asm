; DESCRIPTION: Composite: Draws a magenta circle centered at (129, 73) with radius 55 then Places a green 101x107 rectangle at position (411, 49).
; PLAN: r0=129(x), r1=73(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x), r6=49(y), r7=101(width), r8=107(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 73
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 49
LDI r7, 101
LDI r8, 107
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
