; DESCRIPTION: Draws a green rectangle at (173, 155) with width 77 and height 100.
; PLAN: r0=173(x), r1=155(y), r2=77(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 155
LDI r2, 77
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
