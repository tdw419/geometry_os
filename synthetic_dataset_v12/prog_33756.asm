; DESCRIPTION: Draws a magenta rectangle at (218, 76) with width 71 and height 73.
; PLAN: r0=218(x), r1=76(y), r2=71(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 76
LDI r2, 71
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
