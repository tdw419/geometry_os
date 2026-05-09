; DESCRIPTION: Draws a green rectangle at (333, 83) with width 22 and height 92.
; PLAN: r0=333(x), r1=83(y), r2=22(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 83
LDI r2, 22
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
