; DESCRIPTION: Draws a red rectangle at (53, 44) with width 101 and height 81.
; PLAN: r0=53(x), r1=44(y), r2=101(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 44
LDI r2, 101
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
