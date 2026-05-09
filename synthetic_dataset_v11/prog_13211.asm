; DESCRIPTION: Draws a white rectangle at (28, 43) with width 104 and height 40.
; PLAN: r0=28(x), r1=43(y), r2=104(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 43
LDI r2, 104
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
