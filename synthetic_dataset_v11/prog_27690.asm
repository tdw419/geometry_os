; DESCRIPTION: Draws a red rectangle at (53, 20) with width 58 and height 101.
; PLAN: r0=53(x), r1=20(y), r2=58(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 20
LDI r2, 58
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
