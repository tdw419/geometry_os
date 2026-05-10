; DESCRIPTION: Draws a white rectangle at (480, 88) with width 26 and height 21.
; PLAN: r0=480(x), r1=88(y), r2=26(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 88
LDI r2, 26
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
