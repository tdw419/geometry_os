; DESCRIPTION: Draws a black rectangle at (353, 25) with width 77 and height 119.
; PLAN: r0=353(x), r1=25(y), r2=77(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 25
LDI r2, 77
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
