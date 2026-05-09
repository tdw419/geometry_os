; DESCRIPTION: Draws a red rectangle at (427, 70) with width 12 and height 104.
; PLAN: r0=427(x), r1=70(y), r2=12(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 70
LDI r2, 12
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
