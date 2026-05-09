; DESCRIPTION: Draws a black rectangle at (293, 151) with width 30 and height 86.
; PLAN: r0=293(x), r1=151(y), r2=30(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 151
LDI r2, 30
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
