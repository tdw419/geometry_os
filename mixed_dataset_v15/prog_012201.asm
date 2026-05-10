; DESCRIPTION: Composite: Draws a magenta circle centered at (57, 137) with radius 31 then Places a purple 115x81 rectangle at position (126, 0).
; PLAN: r0=57(x), r1=137(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x), r6=0(y), r7=115(width), r8=81(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 57
LDI r1, 137
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 0
LDI r7, 115
LDI r8, 81
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
