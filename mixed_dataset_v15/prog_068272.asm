; DESCRIPTION: Draws a magenta rectangle at (44, 162) with width 14 and height 82.
; PLAN: r0=44(x), r1=162(y), r2=14(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 162
LDI r2, 14
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
