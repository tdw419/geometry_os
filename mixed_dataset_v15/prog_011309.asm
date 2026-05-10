; DESCRIPTION: Composite: Renders a white disk with center (156, 96) and radius 57 then Creates a black rectangular region at (281, 113) spanning 113 by 84 pixels.
; PLAN: r0=156(x), r1=96(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=281(x), r6=113(y), r7=113(width), r8=84(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 96
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 281
LDI r6, 113
LDI r7, 113
LDI r8, 84
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
