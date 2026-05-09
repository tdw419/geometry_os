; DESCRIPTION: Composite: Draws a yellow rectangle at (42, 28) with width 108 and height 113 then Draws a green circle centered at (350, 90) with radius 61.
; PLAN: r0=42(x), r1=28(y), r2=108(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=350(x), r6=90(y), r7=61(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 42
LDI r1, 28
LDI r2, 108
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 90
LDI r7, 61
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
