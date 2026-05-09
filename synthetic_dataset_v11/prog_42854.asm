; DESCRIPTION: Draws a magenta rectangle at (162, 58) with width 38 and height 76.
; PLAN: r0=162(x), r1=58(y), r2=38(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 58
LDI r2, 38
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
