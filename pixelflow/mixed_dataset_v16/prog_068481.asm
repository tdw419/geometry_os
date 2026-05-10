; DESCRIPTION: Draws a magenta rectangle at (172, 130) with width 104 and height 111.
; PLAN: r0=172(x), r1=130(y), r2=104(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 130
LDI r2, 104
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
