; DESCRIPTION: Draws a green rectangle at (88, 143) with width 98 and height 104.
; PLAN: r0=88(x), r1=143(y), r2=98(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 143
LDI r2, 98
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
