; DESCRIPTION: Draws a orange rectangle at (37, 73) with width 11 and height 71.
; PLAN: r0=37(x), r1=73(y), r2=11(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 73
LDI r2, 11
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
