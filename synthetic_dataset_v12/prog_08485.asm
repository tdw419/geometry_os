; DESCRIPTION: Draws a white rectangle at (19, 134) with width 94 and height 12.
; PLAN: r0=19(x), r1=134(y), r2=94(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 134
LDI r2, 94
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
