; DESCRIPTION: Draws a magenta rectangle at (23, 72) with width 73 and height 71.
; PLAN: r0=23(x), r1=72(y), r2=73(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 72
LDI r2, 73
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
