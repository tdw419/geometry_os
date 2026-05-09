; DESCRIPTION: Draws a black rectangle at (293, 142) with width 71 and height 96.
; PLAN: r0=293(x), r1=142(y), r2=71(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 142
LDI r2, 71
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
