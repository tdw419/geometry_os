; DESCRIPTION: Draws a magenta rectangle at (332, 71) with width 14 and height 71.
; PLAN: r0=332(x), r1=71(y), r2=14(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 71
LDI r2, 14
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
