; DESCRIPTION: Draws a green rectangle at (295, 104) with width 76 and height 68.
; PLAN: r0=295(x), r1=104(y), r2=76(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 104
LDI r2, 76
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
