; DESCRIPTION: Composite: Creates a black rectangular region at (50, 189) spanning 90 by 41 pixels then Creates a orange circular shape at (103, 194) with radius 48.
; PLAN: r0=50(x), r1=189(y), r2=90(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=103(x), r6=194(y), r7=48(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 50
LDI r1, 189
LDI r2, 90
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 194
LDI r7, 48
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
