; DESCRIPTION: Composite: Renders a red disk with center (153, 168) and radius 69 then Draws a magenta rectangle at (160, 143) with width 88 and height 84.
; PLAN: r0=153(x), r1=168(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=160(x), r6=143(y), r7=88(width), r8=84(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 153
LDI r1, 168
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 160
LDI r6, 143
LDI r7, 88
LDI r8, 84
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
