; DESCRIPTION: Draws a orange rectangle at (76, 39) with width 44 and height 58.
; PLAN: r0=76(x), r1=39(y), r2=44(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 39
LDI r2, 44
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
