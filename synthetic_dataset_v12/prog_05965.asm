; DESCRIPTION: Composite: Renders a orange box of size 44x114 starting at (278, 34) then Draws a yellow circle centered at (224, 159) with radius 18.
; PLAN: r0=278(x), r1=34(y), r2=44(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=224(x), r6=159(y), r7=18(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 278
LDI r1, 34
LDI r2, 44
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 159
LDI r7, 18
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
