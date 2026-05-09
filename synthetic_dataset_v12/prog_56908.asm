; DESCRIPTION: Draws a orange rectangle at (426, 79) with width 47 and height 71.
; PLAN: r0=426(x), r1=79(y), r2=47(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 79
LDI r2, 47
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
