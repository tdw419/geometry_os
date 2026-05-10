; DESCRIPTION: Draws a magenta rectangle at (225, 131) with width 98 and height 104.
; PLAN: r0=225(x), r1=131(y), r2=98(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 131
LDI r2, 98
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
