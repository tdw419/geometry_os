; DESCRIPTION: Draws a yellow rectangle at (322, 24) with width 29 and height 70.
; PLAN: r0=322(x), r1=24(y), r2=29(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 24
LDI r2, 29
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
