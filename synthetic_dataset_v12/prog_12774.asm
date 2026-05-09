; DESCRIPTION: Composite: Creates a magenta rectangular region at (228, 15) spanning 114 by 10 pixels then Places a black circle of radius 63 at center (98, 95).
; PLAN: r0=228(x), r1=15(y), r2=114(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x), r6=95(y), r7=63(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 228
LDI r1, 15
LDI r2, 114
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 95
LDI r7, 63
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
