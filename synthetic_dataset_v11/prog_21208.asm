; DESCRIPTION: Draws a orange rectangle at (84, 49) with width 59 and height 12.
; PLAN: r0=84(x), r1=49(y), r2=59(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 49
LDI r2, 59
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
