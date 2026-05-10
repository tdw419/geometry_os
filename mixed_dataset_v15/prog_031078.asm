; DESCRIPTION: Draws a orange rectangle at (412, 227) with width 21 and height 25.
; PLAN: r0=412(x), r1=227(y), r2=21(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 227
LDI r2, 21
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
