; DESCRIPTION: Draws a orange rectangle at (171, 170) with width 75 and height 82.
; PLAN: r0=171(x), r1=170(y), r2=75(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 170
LDI r2, 75
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
