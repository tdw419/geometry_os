; DESCRIPTION: Draws a orange rectangle at (258, 97) with width 38 and height 103.
; PLAN: r0=258(x), r1=97(y), r2=38(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 97
LDI r2, 38
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
