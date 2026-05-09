; DESCRIPTION: Draws a orange rectangle at (75, 102) with width 98 and height 72.
; PLAN: r0=75(x), r1=102(y), r2=98(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 102
LDI r2, 98
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
