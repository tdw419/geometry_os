; DESCRIPTION: Draws a white rectangle at (210, 35) with width 105 and height 39.
; PLAN: r0=210(x), r1=35(y), r2=105(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 35
LDI r2, 105
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
