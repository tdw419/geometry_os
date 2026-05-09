; DESCRIPTION: Composite: Places a white circle of radius 10 at center (422, 172) then Draws a black rectangle at (182, 195) with width 48 and height 56.
; PLAN: r0=422(x), r1=172(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x), r6=195(y), r7=48(width), r8=56(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 172
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 195
LDI r7, 48
LDI r8, 56
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
