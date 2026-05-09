; DESCRIPTION: Draws a white rectangle at (278, 78) with width 104 and height 113.
; PLAN: r0=278(x), r1=78(y), r2=104(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 78
LDI r2, 104
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
