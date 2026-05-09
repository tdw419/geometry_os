; DESCRIPTION: Draws a yellow rectangle at (333, 77) with width 39 and height 29.
; PLAN: r0=333(x), r1=77(y), r2=39(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 77
LDI r2, 39
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
