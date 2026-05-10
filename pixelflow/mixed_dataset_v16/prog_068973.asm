; DESCRIPTION: Draws a white rectangle at (354, 65) with width 35 and height 78.
; PLAN: r0=354(x), r1=65(y), r2=35(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 65
LDI r2, 35
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
