; DESCRIPTION: Composite: Creates a cyan rectangular region at (362, 18) spanning 104 by 27 pixels then Creates a magenta circular shape at (227, 181) with radius 67.
; PLAN: r0=362(x), r1=18(y), r2=104(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=227(x), r6=181(y), r7=67(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 362
LDI r1, 18
LDI r2, 104
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 181
LDI r7, 67
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
