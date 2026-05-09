; DESCRIPTION: Draws a white rectangle at (39, 86) with width 115 and height 26.
; PLAN: r0=39(x), r1=86(y), r2=115(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 86
LDI r2, 115
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
