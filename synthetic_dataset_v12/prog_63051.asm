; DESCRIPTION: Draws a red rectangle at (70, 56) with width 108 and height 119.
; PLAN: r0=70(x), r1=56(y), r2=108(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 56
LDI r2, 108
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
