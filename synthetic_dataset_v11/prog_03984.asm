; DESCRIPTION: Draws a orange rectangle at (108, 140) with width 47 and height 60.
; PLAN: r0=108(x), r1=140(y), r2=47(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 140
LDI r2, 47
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
