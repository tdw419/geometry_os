; DESCRIPTION: Draws a blue rectangle at (458, 203) with width 34 and height 22.
; PLAN: r0=458(x), r1=203(y), r2=34(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 203
LDI r2, 34
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
