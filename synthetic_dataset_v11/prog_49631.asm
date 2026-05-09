; DESCRIPTION: Draws a white rectangle at (19, 102) with width 86 and height 85.
; PLAN: r0=19(x), r1=102(y), r2=86(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 102
LDI r2, 86
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
