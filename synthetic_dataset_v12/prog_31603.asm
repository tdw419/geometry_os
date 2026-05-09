; DESCRIPTION: Composite: Renders a orange box of size 109x15 starting at (384, 47) then Draws a white circle centered at (407, 204) with radius 39.
; PLAN: r0=384(x), r1=47(y), r2=109(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x), r6=204(y), r7=39(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 384
LDI r1, 47
LDI r2, 109
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 204
LDI r7, 39
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
