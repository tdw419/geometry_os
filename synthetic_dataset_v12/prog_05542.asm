; DESCRIPTION: Composite: Draws a black circle centered at (403, 68) with radius 41 then Renders a purple box of size 31x76 starting at (49, 13).
; PLAN: r0=403(x), r1=68(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x), r6=13(y), r7=31(width), r8=76(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 403
LDI r1, 68
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 13
LDI r7, 31
LDI r8, 76
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
