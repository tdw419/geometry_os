; DESCRIPTION: Draws a orange rectangle at (272, 118) with width 53 and height 82.
; PLAN: r0=272(x), r1=118(y), r2=53(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 118
LDI r2, 53
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
