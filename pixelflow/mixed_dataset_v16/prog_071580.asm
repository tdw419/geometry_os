; DESCRIPTION: Composite: Draws a yellow rectangle at (161, 155) with width 62 and height 83 then Places a purple circle of radius 27 at center (113, 57).
; PLAN: r0=161(x), r1=155(y), r2=62(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x), r6=57(y), r7=27(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 161
LDI r1, 155
LDI r2, 62
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 57
LDI r7, 27
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
