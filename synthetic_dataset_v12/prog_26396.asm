; DESCRIPTION: Draws a magenta rectangle at (142, 105) with width 76 and height 117.
; PLAN: r0=142(x), r1=105(y), r2=76(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 105
LDI r2, 76
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
