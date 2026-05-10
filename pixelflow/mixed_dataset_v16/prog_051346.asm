; DESCRIPTION: Composite: Creates a magenta circular shape at (76, 91) with radius 55 then Places a orange 53x41 rectangle at position (71, 203).
; PLAN: r0=76(x), r1=91(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=71(x), r6=203(y), r7=53(width), r8=41(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 76
LDI r1, 91
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 71
LDI r6, 203
LDI r7, 53
LDI r8, 41
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
