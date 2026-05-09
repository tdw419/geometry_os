; DESCRIPTION: Draws a orange rectangle at (54, 76) with width 82 and height 22.
; PLAN: r0=54(x), r1=76(y), r2=82(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 76
LDI r2, 82
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
