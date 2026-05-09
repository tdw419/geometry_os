; DESCRIPTION: Composite: Creates a red circular shape at (414, 160) with radius 71 then Draws a orange rectangle at (160, 53) with width 73 and height 16.
; PLAN: r0=414(x), r1=160(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=160(x), r6=53(y), r7=73(width), r8=16(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 160
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 160
LDI r6, 53
LDI r7, 73
LDI r8, 16
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
