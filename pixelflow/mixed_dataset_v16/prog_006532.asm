; DESCRIPTION: Composite: Draws a yellow rectangle at (212, 29) with width 72 and height 32 then Draws a purple circle centered at (210, 235) with radius 13.
; PLAN: r0=212(x), r1=29(y), r2=72(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=210(x), r6=235(y), r7=13(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 212
LDI r1, 29
LDI r2, 72
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 235
LDI r7, 13
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
