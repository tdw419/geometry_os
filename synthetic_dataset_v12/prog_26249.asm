; DESCRIPTION: Composite: Creates a magenta rectangular region at (114, 27) spanning 63 by 113 pixels then Creates a blue circular shape at (22, 217) with radius 12.
; PLAN: r0=114(x), r1=27(y), r2=63(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=22(x), r6=217(y), r7=12(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 114
LDI r1, 27
LDI r2, 63
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 217
LDI r7, 12
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
