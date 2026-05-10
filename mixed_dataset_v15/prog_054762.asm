; DESCRIPTION: Draws a magenta rectangle at (117, 26) with width 28 and height 55.
; PLAN: r0=117(x), r1=26(y), r2=28(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 26
LDI r2, 28
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
