; DESCRIPTION: Draws a orange rectangle at (144, 133) with width 65 and height 71.
; PLAN: r0=144(x), r1=133(y), r2=65(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 133
LDI r2, 65
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
