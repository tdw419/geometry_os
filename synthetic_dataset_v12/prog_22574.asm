; DESCRIPTION: Composite: Renders a green box of size 91x86 starting at (330, 92) then Draws a orange circle centered at (155, 142) with radius 78.
; PLAN: r0=330(x), r1=92(y), r2=91(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=155(x), r6=142(y), r7=78(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 330
LDI r1, 92
LDI r2, 91
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 142
LDI r7, 78
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
