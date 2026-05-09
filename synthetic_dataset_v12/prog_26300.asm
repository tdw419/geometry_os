; DESCRIPTION: Draws a red rectangle at (84, 104) with width 76 and height 38.
; PLAN: r0=84(x), r1=104(y), r2=76(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 104
LDI r2, 76
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
