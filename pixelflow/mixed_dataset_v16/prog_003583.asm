; DESCRIPTION: Composite: Renders a green disk with center (272, 134) and radius 60 then Creates a black rectangular region at (212, 21) spanning 73 by 29 pixels.
; PLAN: r0=272(x), r1=134(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=212(x), r6=21(y), r7=73(width), r8=29(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 272
LDI r1, 134
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 212
LDI r6, 21
LDI r7, 73
LDI r8, 29
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
