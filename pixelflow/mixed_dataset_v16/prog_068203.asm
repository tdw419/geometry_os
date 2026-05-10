; DESCRIPTION: Draws a orange rectangle at (112, 134) with width 55 and height 90.
; PLAN: r0=112(x), r1=134(y), r2=55(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 134
LDI r2, 55
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
