; DESCRIPTION: Composite: Creates a magenta circular shape at (377, 172) with radius 67 then Draws a orange rectangle at (200, 108) with width 94 and height 109.
; PLAN: r0=377(x), r1=172(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=200(x), r6=108(y), r7=94(width), r8=109(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 377
LDI r1, 172
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 200
LDI r6, 108
LDI r7, 94
LDI r8, 109
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
