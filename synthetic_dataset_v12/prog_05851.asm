; DESCRIPTION: Composite: Draws a magenta rectangle at (370, 28) with width 117 and height 35 then Creates a blue circular shape at (208, 93) with radius 65.
; PLAN: r0=370(x), r1=28(y), r2=117(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x), r6=93(y), r7=65(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 370
LDI r1, 28
LDI r2, 117
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 93
LDI r7, 65
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
