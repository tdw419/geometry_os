; DESCRIPTION: Composite: Creates a red circular shape at (61, 179) with radius 58 then Creates a black rectangular region at (272, 41) spanning 85 by 66 pixels.
; PLAN: r0=61(x), r1=179(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x), r6=41(y), r7=85(width), r8=66(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 179
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 41
LDI r7, 85
LDI r8, 66
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
