; DESCRIPTION: Draws a white rectangle at (16, 9) with width 13 and height 119.
; PLAN: r0=16(x), r1=9(y), r2=13(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 9
LDI r2, 13
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
