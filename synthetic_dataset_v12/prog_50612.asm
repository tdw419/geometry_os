; DESCRIPTION: Draws a yellow rectangle at (157, 37) with width 47 and height 92.
; PLAN: r0=157(x), r1=37(y), r2=47(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 37
LDI r2, 47
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
