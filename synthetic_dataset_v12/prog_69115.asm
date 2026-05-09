; DESCRIPTION: Draws a red rectangle at (134, 83) with width 104 and height 13.
; PLAN: r0=134(x), r1=83(y), r2=104(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 83
LDI r2, 104
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
