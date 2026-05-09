; DESCRIPTION: Draws a magenta rectangle at (100, 191) with width 113 and height 57.
; PLAN: r0=100(x), r1=191(y), r2=113(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 191
LDI r2, 113
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
