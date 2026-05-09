; DESCRIPTION: Draws a white rectangle at (35, 99) with width 27 and height 119.
; PLAN: r0=35(x), r1=99(y), r2=27(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 99
LDI r2, 27
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
