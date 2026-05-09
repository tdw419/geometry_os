; DESCRIPTION: Draws a red rectangle at (102, 18) with width 45 and height 88.
; PLAN: r0=102(x), r1=18(y), r2=45(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 18
LDI r2, 45
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
