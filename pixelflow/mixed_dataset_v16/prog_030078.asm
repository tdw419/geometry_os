; DESCRIPTION: Draws a black rectangle at (125, 142) with width 27 and height 74.
; PLAN: r0=125(x), r1=142(y), r2=27(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 142
LDI r2, 27
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
