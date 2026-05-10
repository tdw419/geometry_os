; DESCRIPTION: Draws a green rectangle at (173, 162) with width 119 and height 56.
; PLAN: r0=173(x), r1=162(y), r2=119(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 162
LDI r2, 119
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
