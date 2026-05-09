; DESCRIPTION: Draws a black rectangle at (189, 79) with width 46 and height 28.
; PLAN: r0=189(x), r1=79(y), r2=46(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 79
LDI r2, 46
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
