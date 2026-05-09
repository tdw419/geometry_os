; DESCRIPTION: Draws a magenta rectangle at (298, 69) with width 116 and height 119.
; PLAN: r0=298(x), r1=69(y), r2=116(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 69
LDI r2, 116
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
