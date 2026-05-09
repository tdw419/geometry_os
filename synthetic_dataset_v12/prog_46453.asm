; DESCRIPTION: Draws a magenta rectangle at (407, 168) with width 90 and height 19.
; PLAN: r0=407(x), r1=168(y), r2=90(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 168
LDI r2, 90
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
