; DESCRIPTION: Draws a magenta rectangle at (222, 2) with width 49 and height 104.
; PLAN: r0=222(x), r1=2(y), r2=49(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 2
LDI r2, 49
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
