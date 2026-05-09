; DESCRIPTION: Draws a orange rectangle at (141, 14) with width 59 and height 19.
; PLAN: r0=141(x), r1=14(y), r2=59(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 14
LDI r2, 59
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
