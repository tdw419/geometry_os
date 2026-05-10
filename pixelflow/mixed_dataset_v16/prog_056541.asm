; DESCRIPTION: Draws a orange rectangle at (210, 138) with width 83 and height 105.
; PLAN: r0=210(x), r1=138(y), r2=83(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 138
LDI r2, 83
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
