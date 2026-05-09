; DESCRIPTION: Composite: Places a orange circle of radius 24 at center (213, 136) then Places a orange 43x69 rectangle at position (224, 6).
; PLAN: r0=213(x), r1=136(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=224(x), r6=6(y), r7=43(width), r8=69(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 213
LDI r1, 136
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 224
LDI r6, 6
LDI r7, 43
LDI r8, 69
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
