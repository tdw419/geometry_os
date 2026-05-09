; DESCRIPTION: Composite: Creates a orange rectangular region at (359, 134) spanning 82 by 48 pixels then Renders a green disk with center (189, 155) and radius 25.
; PLAN: r0=359(x), r1=134(y), r2=82(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=189(x), r6=155(y), r7=25(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 359
LDI r1, 134
LDI r2, 82
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 155
LDI r7, 25
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
