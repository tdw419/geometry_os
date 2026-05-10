; DESCRIPTION: Draws a magenta rectangle at (285, 191) with width 65 and height 46.
; PLAN: r0=285(x), r1=191(y), r2=65(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 191
LDI r2, 65
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
