; DESCRIPTION: Composite: Creates a green rectangular region at (62, 78) spanning 16 by 38 pixels then Places a orange dot at position (454, 98).
; PLAN: r0=62(x), r1=78(y), r2=16(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x), r6=98(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 62
LDI r1, 78
LDI r2, 16
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 98
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
