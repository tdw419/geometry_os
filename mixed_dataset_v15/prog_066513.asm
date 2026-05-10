; DESCRIPTION: Draws a orange rectangle at (95, 119) with width 116 and height 46.
; PLAN: r0=95(x), r1=119(y), r2=116(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 119
LDI r2, 116
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
