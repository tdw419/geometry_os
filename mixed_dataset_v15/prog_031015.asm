; DESCRIPTION: Draws a yellow rectangle at (241, 28) with width 29 and height 37.
; PLAN: r0=241(x), r1=28(y), r2=29(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 28
LDI r2, 29
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
