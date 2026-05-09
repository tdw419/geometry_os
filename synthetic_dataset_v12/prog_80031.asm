; DESCRIPTION: Draws a black rectangle at (256, 195) with width 61 and height 18.
; PLAN: r0=256(x), r1=195(y), r2=61(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 195
LDI r2, 61
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
