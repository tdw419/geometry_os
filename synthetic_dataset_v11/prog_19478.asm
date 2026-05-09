; DESCRIPTION: Draws a black rectangle at (143, 58) with width 56 and height 18.
; PLAN: r0=143(x), r1=58(y), r2=56(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 58
LDI r2, 56
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
