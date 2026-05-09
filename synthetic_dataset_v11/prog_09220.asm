; DESCRIPTION: Draws a black rectangle at (174, 116) with width 72 and height 105.
; PLAN: r0=174(x), r1=116(y), r2=72(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 116
LDI r2, 72
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
