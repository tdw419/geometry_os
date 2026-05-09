; DESCRIPTION: Composite: Draws a green circle centered at (185, 194) with radius 35 then Draws a black rectangle at (321, 96) with width 72 and height 63.
; PLAN: r0=185(x), r1=194(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x), r6=96(y), r7=72(width), r8=63(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 185
LDI r1, 194
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 96
LDI r7, 72
LDI r8, 63
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
