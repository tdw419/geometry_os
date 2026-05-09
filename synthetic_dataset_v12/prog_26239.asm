; DESCRIPTION: Draws a magenta rectangle at (449, 116) with width 30 and height 10.
; PLAN: r0=449(x), r1=116(y), r2=30(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 116
LDI r2, 30
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
