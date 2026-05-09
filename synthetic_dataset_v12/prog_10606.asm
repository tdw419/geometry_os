; DESCRIPTION: Draws a magenta rectangle at (171, 104) with width 25 and height 83.
; PLAN: r0=171(x), r1=104(y), r2=25(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 104
LDI r2, 25
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
