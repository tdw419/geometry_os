; DESCRIPTION: Composite: Creates a red rectangular region at (465, 7) spanning 18 by 111 pixels then Draws a black circle centered at (97, 113) with radius 64.
; PLAN: r0=465(x), r1=7(y), r2=18(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=97(x), r6=113(y), r7=64(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 465
LDI r1, 7
LDI r2, 18
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 113
LDI r7, 64
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
