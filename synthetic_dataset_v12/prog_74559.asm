; DESCRIPTION: Draws a black rectangle at (465, 116) with width 40 and height 69.
; PLAN: r0=465(x), r1=116(y), r2=40(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 116
LDI r2, 40
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
