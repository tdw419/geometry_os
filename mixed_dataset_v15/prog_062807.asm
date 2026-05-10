; DESCRIPTION: Composite: Creates a orange rectangular region at (334, 138) spanning 111 by 54 pixels then Creates a yellow circular shape at (167, 57) with radius 14.
; PLAN: r0=334(x), r1=138(y), r2=111(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=167(x), r6=57(y), r7=14(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 334
LDI r1, 138
LDI r2, 111
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 57
LDI r7, 14
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
