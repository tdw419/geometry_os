; DESCRIPTION: Draws a red rectangle at (136, 98) with width 96 and height 104.
; PLAN: r0=136(x), r1=98(y), r2=96(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 98
LDI r2, 96
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
