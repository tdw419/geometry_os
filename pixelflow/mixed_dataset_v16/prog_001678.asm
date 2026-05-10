; DESCRIPTION: Draws a green rectangle at (173, 88) with width 113 and height 71.
; PLAN: r0=173(x), r1=88(y), r2=113(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 88
LDI r2, 113
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
