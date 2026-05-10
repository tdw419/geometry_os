; DESCRIPTION: Draws a magenta rectangle at (245, 60) with width 19 and height 45.
; PLAN: r0=245(x), r1=60(y), r2=19(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 60
LDI r2, 19
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
