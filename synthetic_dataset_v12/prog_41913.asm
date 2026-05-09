; DESCRIPTION: Composite: Draws a yellow circle centered at (204, 66) with radius 45 then Renders a black box of size 71x38 starting at (28, 170).
; PLAN: r0=204(x), r1=66(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=28(x), r6=170(y), r7=71(width), r8=38(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 204
LDI r1, 66
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 28
LDI r6, 170
LDI r7, 71
LDI r8, 38
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
