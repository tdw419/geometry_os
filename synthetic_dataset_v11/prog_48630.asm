; DESCRIPTION: Draws a yellow rectangle at (173, 119) with width 36 and height 30.
; PLAN: r0=173(x), r1=119(y), r2=36(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 119
LDI r2, 36
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
