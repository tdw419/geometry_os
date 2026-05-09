; DESCRIPTION: Draws a orange rectangle at (225, 70) with width 59 and height 15.
; PLAN: r0=225(x), r1=70(y), r2=59(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 70
LDI r2, 59
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
