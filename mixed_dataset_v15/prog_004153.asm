; DESCRIPTION: Draws a white rectangle at (288, 198) with width 99 and height 25.
; PLAN: r0=288(x), r1=198(y), r2=99(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 198
LDI r2, 99
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
