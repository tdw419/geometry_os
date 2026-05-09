; DESCRIPTION: Draws a red rectangle at (77, 18) with width 88 and height 21.
; PLAN: r0=77(x), r1=18(y), r2=88(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 18
LDI r2, 88
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
