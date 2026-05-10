; DESCRIPTION: Composite: Renders a red box of size 62x83 starting at (261, 122) then Draws a blue circle centered at (38, 229) with radius 23.
; PLAN: r0=261(x), r1=122(y), r2=62(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=38(x), r6=229(y), r7=23(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 261
LDI r1, 122
LDI r2, 62
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 229
LDI r7, 23
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
