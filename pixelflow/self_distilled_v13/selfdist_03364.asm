; DESCRIPTION: Draws a green rectangle at (71, 70) with width 104 and height 62.
; PLAN: r0=71(x), r1=70(y), r2=104(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 70
LDI r2, 104
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
