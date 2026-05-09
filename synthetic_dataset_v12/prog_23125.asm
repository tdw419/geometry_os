; DESCRIPTION: Composite: Draws a red rectangle at (492, 142) with width 16 and height 98 then Draws a magenta circle centered at (278, 91) with radius 61.
; PLAN: r0=492(x), r1=142(y), r2=16(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x), r6=91(y), r7=61(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 492
LDI r1, 142
LDI r2, 16
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 91
LDI r7, 61
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
