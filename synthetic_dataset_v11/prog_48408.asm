; DESCRIPTION: Draws a green rectangle at (72, 73) with width 102 and height 18.
; PLAN: r0=72(x), r1=73(y), r2=102(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 73
LDI r2, 102
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
