; DESCRIPTION: Composite: Creates a white rectangular region at (63, 25) spanning 95 by 24 pixels then Places a red circle of radius 71 at center (122, 84).
; PLAN: r0=63(x), r1=25(y), r2=95(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x), r6=84(y), r7=71(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 63
LDI r1, 25
LDI r2, 95
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 84
LDI r7, 71
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
