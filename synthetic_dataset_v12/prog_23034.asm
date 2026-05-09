; DESCRIPTION: Draws a white rectangle at (175, 12) with width 65 and height 97.
; PLAN: r0=175(x), r1=12(y), r2=65(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 12
LDI r2, 65
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
