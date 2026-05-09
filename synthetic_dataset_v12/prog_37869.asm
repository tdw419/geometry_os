; DESCRIPTION: Composite: Creates a yellow rectangular region at (371, 131) spanning 99 by 117 pixels then Creates a yellow circular shape at (181, 108) with radius 71.
; PLAN: r0=371(x), r1=131(y), r2=99(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=181(x), r6=108(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 371
LDI r1, 131
LDI r2, 99
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 108
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
