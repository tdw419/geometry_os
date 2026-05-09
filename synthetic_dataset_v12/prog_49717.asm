; DESCRIPTION: Draws a black rectangle at (230, 223) with width 72 and height 11.
; PLAN: r0=230(x), r1=223(y), r2=72(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 223
LDI r2, 72
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
