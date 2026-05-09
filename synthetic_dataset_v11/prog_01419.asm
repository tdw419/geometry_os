; DESCRIPTION: Draws a magenta rectangle at (153, 100) with width 95 and height 104.
; PLAN: r0=153(x), r1=100(y), r2=95(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 100
LDI r2, 95
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
