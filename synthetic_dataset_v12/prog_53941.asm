; DESCRIPTION: Draws a magenta rectangle at (232, 126) with width 86 and height 45.
; PLAN: r0=232(x), r1=126(y), r2=86(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 126
LDI r2, 86
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
