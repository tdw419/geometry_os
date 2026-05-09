; DESCRIPTION: Draws a orange rectangle at (119, 197) with width 119 and height 56.
; PLAN: r0=119(x), r1=197(y), r2=119(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 197
LDI r2, 119
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
