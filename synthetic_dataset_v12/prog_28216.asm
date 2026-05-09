; DESCRIPTION: Composite: Creates a orange circular shape at (71, 191) with radius 21 then Places a yellow 53x82 rectangle at position (428, 33).
; PLAN: r0=71(x), r1=191(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=428(x), r6=33(y), r7=53(width), r8=82(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 71
LDI r1, 191
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 428
LDI r6, 33
LDI r7, 53
LDI r8, 82
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
