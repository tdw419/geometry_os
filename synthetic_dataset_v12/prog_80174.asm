; DESCRIPTION: Draws a orange rectangle at (443, 40) with width 29 and height 45.
; PLAN: r0=443(x), r1=40(y), r2=29(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 40
LDI r2, 29
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
