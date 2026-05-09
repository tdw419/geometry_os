; DESCRIPTION: Draws a black rectangle at (98, 122) with width 80 and height 112.
; PLAN: r0=98(x), r1=122(y), r2=80(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 122
LDI r2, 80
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
