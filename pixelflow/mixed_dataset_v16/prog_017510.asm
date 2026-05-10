; DESCRIPTION: Draws a magenta rectangle at (225, 206) with width 104 and height 18.
; PLAN: r0=225(x), r1=206(y), r2=104(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 206
LDI r2, 104
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
