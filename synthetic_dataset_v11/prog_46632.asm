; DESCRIPTION: Draws a orange rectangle at (197, 62) with width 18 and height 84.
; PLAN: r0=197(x), r1=62(y), r2=18(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 62
LDI r2, 18
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
