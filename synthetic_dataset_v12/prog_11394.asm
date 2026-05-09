; DESCRIPTION: Draws a orange rectangle at (37, 98) with width 108 and height 79.
; PLAN: r0=37(x), r1=98(y), r2=108(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 98
LDI r2, 108
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
