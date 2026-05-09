; DESCRIPTION: Composite: Places a blue 78x105 rectangle at position (338, 127) then Renders a magenta disk with center (153, 119) and radius 69.
; PLAN: r0=338(x), r1=127(y), r2=78(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=153(x), r6=119(y), r7=69(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 338
LDI r1, 127
LDI r2, 78
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 119
LDI r7, 69
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
