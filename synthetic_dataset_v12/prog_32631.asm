; DESCRIPTION: Draws a magenta rectangle at (33, 135) with width 76 and height 79.
; PLAN: r0=33(x), r1=135(y), r2=76(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 135
LDI r2, 76
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
