; DESCRIPTION: Draws a magenta rectangle at (151, 143) with width 50 and height 100.
; PLAN: r0=151(x), r1=143(y), r2=50(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 143
LDI r2, 50
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
