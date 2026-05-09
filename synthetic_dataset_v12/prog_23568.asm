; DESCRIPTION: Draws a yellow rectangle at (383, 181) with width 70 and height 13.
; PLAN: r0=383(x), r1=181(y), r2=70(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 181
LDI r2, 70
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
