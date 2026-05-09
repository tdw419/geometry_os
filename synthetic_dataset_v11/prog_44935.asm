; DESCRIPTION: Draws a magenta rectangle at (110, 228) with width 69 and height 15.
; PLAN: r0=110(x), r1=228(y), r2=69(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 228
LDI r2, 69
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
