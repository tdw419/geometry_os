; DESCRIPTION: Composite: Draws a cyan rectangle at (125, 132) with width 38 and height 18 then Creates a green circular shape at (213, 83) with radius 49.
; PLAN: r0=125(x), r1=132(y), r2=38(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x), r6=83(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 125
LDI r1, 132
LDI r2, 38
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 83
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
