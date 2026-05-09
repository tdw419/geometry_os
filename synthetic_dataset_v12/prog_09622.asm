; DESCRIPTION: Draws a white rectangle at (362, 49) with width 39 and height 105.
; PLAN: r0=362(x), r1=49(y), r2=39(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 49
LDI r2, 39
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
