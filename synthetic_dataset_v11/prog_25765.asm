; DESCRIPTION: Draws a magenta rectangle at (31, 191) with width 19 and height 58.
; PLAN: r0=31(x), r1=191(y), r2=19(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 191
LDI r2, 19
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
