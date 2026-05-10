; DESCRIPTION: Composite: Renders a yellow disk with center (219, 163) and radius 40 then Draws a orange rectangle at (126, 146) with width 105 and height 17.
; PLAN: r0=219(x), r1=163(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x), r6=146(y), r7=105(width), r8=17(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 219
LDI r1, 163
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 146
LDI r7, 105
LDI r8, 17
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
