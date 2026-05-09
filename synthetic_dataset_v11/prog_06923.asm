; DESCRIPTION: Draws a orange rectangle at (18, 90) with width 62 and height 82.
; PLAN: r0=18(x), r1=90(y), r2=62(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 90
LDI r2, 62
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
