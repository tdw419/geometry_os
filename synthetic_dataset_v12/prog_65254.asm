; DESCRIPTION: Composite: Creates a yellow rectangular region at (296, 63) spanning 63 by 64 pixels then Places a yellow circle of radius 71 at center (268, 101).
; PLAN: r0=296(x), r1=63(y), r2=63(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=268(x), r6=101(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 296
LDI r1, 63
LDI r2, 63
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 101
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
