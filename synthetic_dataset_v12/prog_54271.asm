; DESCRIPTION: Draws a yellow rectangle at (288, 173) with width 110 and height 21.
; PLAN: r0=288(x), r1=173(y), r2=110(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 173
LDI r2, 110
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
