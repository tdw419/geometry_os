; DESCRIPTION: Draws a magenta rectangle at (99, 164) with width 81 and height 82.
; PLAN: r0=99(x), r1=164(y), r2=81(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 164
LDI r2, 81
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
