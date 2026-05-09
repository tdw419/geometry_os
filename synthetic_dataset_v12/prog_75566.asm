; DESCRIPTION: Draws a magenta rectangle at (298, 105) with width 55 and height 69.
; PLAN: r0=298(x), r1=105(y), r2=55(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 105
LDI r2, 55
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
