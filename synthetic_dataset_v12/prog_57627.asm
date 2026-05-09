; DESCRIPTION: Draws a white rectangle at (175, 78) with width 27 and height 104.
; PLAN: r0=175(x), r1=78(y), r2=27(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 78
LDI r2, 27
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
