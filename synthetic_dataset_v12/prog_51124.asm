; DESCRIPTION: Draws a magenta rectangle at (474, 100) with width 27 and height 61.
; PLAN: r0=474(x), r1=100(y), r2=27(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 100
LDI r2, 27
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
