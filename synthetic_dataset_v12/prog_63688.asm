; DESCRIPTION: Draws a white rectangle at (426, 163) with width 11 and height 39.
; PLAN: r0=426(x), r1=163(y), r2=11(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 163
LDI r2, 11
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
