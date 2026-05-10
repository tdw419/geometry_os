; DESCRIPTION: Composite: Draws a yellow circle centered at (125, 137) with radius 67 then Renders a black box of size 54x37 starting at (203, 166).
; PLAN: r0=125(x), r1=137(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=203(x), r6=166(y), r7=54(width), r8=37(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 125
LDI r1, 137
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 203
LDI r6, 166
LDI r7, 54
LDI r8, 37
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
