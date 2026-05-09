; DESCRIPTION: Draws a cyan rectangle at (72, 105) with width 71 and height 84.
; PLAN: r0=72(x), r1=105(y), r2=71(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 105
LDI r2, 71
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
