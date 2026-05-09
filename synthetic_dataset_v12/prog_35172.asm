; DESCRIPTION: Draws a red rectangle at (270, 20) with width 84 and height 55.
; PLAN: r0=270(x), r1=20(y), r2=84(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 20
LDI r2, 84
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
