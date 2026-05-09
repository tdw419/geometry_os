; DESCRIPTION: Draws a white rectangle at (23, 86) with width 76 and height 15.
; PLAN: r0=23(x), r1=86(y), r2=76(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 86
LDI r2, 76
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
