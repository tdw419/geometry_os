; DESCRIPTION: Draws a orange rectangle at (54, 46) with width 73 and height 108.
; PLAN: r0=54(x), r1=46(y), r2=73(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 46
LDI r2, 73
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
