; DESCRIPTION: Draws a red rectangle at (77, 92) with width 49 and height 69.
; PLAN: r0=77(x), r1=92(y), r2=49(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 92
LDI r2, 49
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
