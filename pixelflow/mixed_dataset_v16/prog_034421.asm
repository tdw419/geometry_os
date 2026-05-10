; DESCRIPTION: Composite: Draws a magenta rectangle at (123, 71) with width 38 and height 117 then Draws a magenta circle centered at (271, 133) with radius 12.
; PLAN: r0=123(x), r1=71(y), r2=38(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=271(x), r6=133(y), r7=12(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 123
LDI r1, 71
LDI r2, 38
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 133
LDI r7, 12
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
