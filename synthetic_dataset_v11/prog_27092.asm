; DESCRIPTION: Draws a orange rectangle at (108, 55) with width 48 and height 53.
; PLAN: r0=108(x), r1=55(y), r2=48(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 55
LDI r2, 48
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
