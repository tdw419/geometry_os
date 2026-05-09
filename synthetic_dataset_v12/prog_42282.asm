; DESCRIPTION: Draws a white rectangle at (15, 175) with width 27 and height 22.
; PLAN: r0=15(x), r1=175(y), r2=27(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 175
LDI r2, 27
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
