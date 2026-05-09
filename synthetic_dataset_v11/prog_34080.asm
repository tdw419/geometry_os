; DESCRIPTION: Draws a red rectangle at (119, 114) with width 108 and height 44.
; PLAN: r0=119(x), r1=114(y), r2=108(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 114
LDI r2, 108
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
