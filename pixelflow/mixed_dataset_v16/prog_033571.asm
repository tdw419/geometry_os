; DESCRIPTION: Draws a red rectangle at (390, 45) with width 28 and height 84.
; PLAN: r0=390(x), r1=45(y), r2=28(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 45
LDI r2, 28
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
