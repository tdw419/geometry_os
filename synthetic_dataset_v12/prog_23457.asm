; DESCRIPTION: Draws a red rectangle at (414, 61) with width 11 and height 88.
; PLAN: r0=414(x), r1=61(y), r2=11(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 61
LDI r2, 11
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
