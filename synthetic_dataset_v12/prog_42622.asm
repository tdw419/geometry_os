; DESCRIPTION: Draws a magenta rectangle at (328, 104) with width 47 and height 117.
; PLAN: r0=328(x), r1=104(y), r2=47(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 104
LDI r2, 47
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
