; DESCRIPTION: Draws a black rectangle at (66, 2) with width 76 and height 57.
; PLAN: r0=66(x), r1=2(y), r2=76(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 2
LDI r2, 76
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
