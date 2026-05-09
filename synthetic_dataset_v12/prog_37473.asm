; DESCRIPTION: Composite: Renders a blue box of size 17x57 starting at (69, 46) then Draws a green circle centered at (232, 161) with radius 25.
; PLAN: r0=69(x), r1=46(y), r2=17(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=232(x), r6=161(y), r7=25(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 69
LDI r1, 46
LDI r2, 17
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 161
LDI r7, 25
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
