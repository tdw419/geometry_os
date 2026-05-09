; DESCRIPTION: Composite: Draws a yellow circle centered at (427, 86) with radius 31 then Renders a blue box of size 41x69 starting at (98, 182).
; PLAN: r0=427(x), r1=86(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x), r6=182(y), r7=41(width), r8=69(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 427
LDI r1, 86
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 182
LDI r7, 41
LDI r8, 69
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
