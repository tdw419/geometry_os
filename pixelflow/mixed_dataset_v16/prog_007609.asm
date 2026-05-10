; DESCRIPTION: Composite: Creates a orange rectangular region at (279, 91) spanning 13 by 22 pixels then Creates a yellow circular shape at (245, 99) with radius 58.
; PLAN: r0=279(x), r1=91(y), r2=13(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x), r6=99(y), r7=58(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 279
LDI r1, 91
LDI r2, 13
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 99
LDI r7, 58
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
