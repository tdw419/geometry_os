; DESCRIPTION: Draws a red rectangle at (283, 19) with width 100 and height 92.
; PLAN: r0=283(x), r1=19(y), r2=100(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 19
LDI r2, 100
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
