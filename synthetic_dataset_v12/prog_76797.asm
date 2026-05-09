; DESCRIPTION: Composite: Creates a orange rectangular region at (27, 109) spanning 52 by 72 pixels then Creates a green circular shape at (456, 176) with radius 16.
; PLAN: r0=27(x), r1=109(y), r2=52(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x), r6=176(y), r7=16(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 27
LDI r1, 109
LDI r2, 52
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 176
LDI r7, 16
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
