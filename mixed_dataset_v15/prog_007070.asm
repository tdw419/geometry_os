; DESCRIPTION: Draws a yellow rectangle at (57, 139) with width 114 and height 64.
; PLAN: r0=57(x), r1=139(y), r2=114(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 139
LDI r2, 114
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
