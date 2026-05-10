; DESCRIPTION: Composite: Draws a magenta circle centered at (314, 56) with radius 33 then Draws a black rectangle at (92, 124) with width 91 and height 98.
; PLAN: r0=314(x), r1=56(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=92(x), r6=124(y), r7=91(width), r8=98(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 314
LDI r1, 56
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 92
LDI r6, 124
LDI r7, 91
LDI r8, 98
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
