; DESCRIPTION: Draws a magenta rectangle at (26, 50) with width 76 and height 34.
; PLAN: r0=26(x), r1=50(y), r2=76(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 50
LDI r2, 76
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
