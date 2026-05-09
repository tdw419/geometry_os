; DESCRIPTION: Composite: Renders a orange box of size 33x107 starting at (374, 102) then Places a white circle of radius 56 at center (285, 176).
; PLAN: r0=374(x), r1=102(y), r2=33(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=285(x), r6=176(y), r7=56(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 374
LDI r1, 102
LDI r2, 33
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 176
LDI r7, 56
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
