; DESCRIPTION: Draws a black rectangle at (313, 28) with width 107 and height 58.
; PLAN: r0=313(x), r1=28(y), r2=107(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 28
LDI r2, 107
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
