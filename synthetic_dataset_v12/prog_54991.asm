; DESCRIPTION: Draws a magenta rectangle at (226, 139) with width 119 and height 104.
; PLAN: r0=226(x), r1=139(y), r2=119(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 139
LDI r2, 119
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
