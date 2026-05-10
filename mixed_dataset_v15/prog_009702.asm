; DESCRIPTION: Composite: Creates a yellow circular shape at (330, 185) with radius 31 then Draws a black rectangle at (334, 212) with width 118 and height 27.
; PLAN: r0=330(x), r1=185(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x), r6=212(y), r7=118(width), r8=27(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 330
LDI r1, 185
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 212
LDI r7, 118
LDI r8, 27
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
