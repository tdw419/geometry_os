; DESCRIPTION: Composite: Renders a black disk with center (291, 72) and radius 53 then Renders a orange box of size 77x107 starting at (320, 90).
; PLAN: r0=291(x), r1=72(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=320(x), r6=90(y), r7=77(width), r8=107(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 72
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 320
LDI r6, 90
LDI r7, 77
LDI r8, 107
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
