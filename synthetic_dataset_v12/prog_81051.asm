; DESCRIPTION: Composite: Draws a cyan rectangle at (291, 102) with width 78 and height 17 then Draws a green circle centered at (412, 98) with radius 38.
; PLAN: r0=291(x), r1=102(y), r2=78(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=412(x), r6=98(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 291
LDI r1, 102
LDI r2, 78
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 98
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
