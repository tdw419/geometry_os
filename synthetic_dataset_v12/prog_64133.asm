; DESCRIPTION: Draws a magenta rectangle at (23, 82) with width 74 and height 84.
; PLAN: r0=23(x), r1=82(y), r2=74(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 82
LDI r2, 74
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
