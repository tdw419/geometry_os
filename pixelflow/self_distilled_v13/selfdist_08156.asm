; DESCRIPTION: Draws a white rectangle at (19, 197) with width 75 and height 78.
; PLAN: r0=19(x), r1=197(y), r2=75(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 197
LDI r2, 75
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
