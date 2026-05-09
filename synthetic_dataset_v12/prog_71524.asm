; DESCRIPTION: Draws a orange rectangle at (241, 170) with width 82 and height 16.
; PLAN: r0=241(x), r1=170(y), r2=82(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 170
LDI r2, 82
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
