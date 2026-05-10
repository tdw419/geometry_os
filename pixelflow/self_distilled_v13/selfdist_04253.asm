; DESCRIPTION: Draws a orange rectangle at (225, 178) with width 84 and height 93.
; PLAN: r0=225(x), r1=178(y), r2=84(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 178
LDI r2, 84
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
