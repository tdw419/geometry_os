; DESCRIPTION: Draws a cyan rectangle at (71, 135) with width 88 and height 119.
; PLAN: r0=71(x), r1=135(y), r2=88(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 135
LDI r2, 88
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
