; DESCRIPTION: Composite: Renders a orange box of size 33x39 starting at (379, 27) then Places a orange circle of radius 71 at center (378, 173).
; PLAN: r0=379(x), r1=27(y), r2=33(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=378(x), r6=173(y), r7=71(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 379
LDI r1, 27
LDI r2, 33
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 173
LDI r7, 71
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
