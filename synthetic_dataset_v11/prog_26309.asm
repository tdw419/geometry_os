; DESCRIPTION: Draws a blue rectangle at (104, 74) with width 85 and height 58.
; PLAN: r0=104(x), r1=74(y), r2=85(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 74
LDI r2, 85
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
