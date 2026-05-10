; DESCRIPTION: Composite: Draws a black circle centered at (69, 157) with radius 41 then Renders a white box of size 81x82 starting at (12, 48).
; PLAN: r0=69(x), r1=157(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=12(x), r6=48(y), r7=81(width), r8=82(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 69
LDI r1, 157
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 12
LDI r6, 48
LDI r7, 81
LDI r8, 82
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
