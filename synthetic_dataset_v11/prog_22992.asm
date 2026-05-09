; DESCRIPTION: Draws a orange rectangle at (206, 125) with width 29 and height 108.
; PLAN: r0=206(x), r1=125(y), r2=29(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 125
LDI r2, 29
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
