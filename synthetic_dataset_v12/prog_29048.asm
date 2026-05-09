; DESCRIPTION: Draws a orange rectangle at (197, 28) with width 26 and height 119.
; PLAN: r0=197(x), r1=28(y), r2=26(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 28
LDI r2, 26
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
