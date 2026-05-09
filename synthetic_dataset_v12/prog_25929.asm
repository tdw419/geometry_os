; DESCRIPTION: Draws a white rectangle at (276, 162) with width 62 and height 18.
; PLAN: r0=276(x), r1=162(y), r2=62(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 162
LDI r2, 62
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
