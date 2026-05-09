; DESCRIPTION: Composite: Draws a yellow rectangle at (370, 2) with width 101 and height 46 then Draws a red circle centered at (102, 108) with radius 40.
; PLAN: r0=370(x), r1=2(y), r2=101(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=102(x), r6=108(y), r7=40(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 370
LDI r1, 2
LDI r2, 101
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 108
LDI r7, 40
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
