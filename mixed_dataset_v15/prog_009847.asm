; DESCRIPTION: Draws a magenta rectangle at (254, 226) with width 38 and height 12.
; PLAN: r0=254(x), r1=226(y), r2=38(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 226
LDI r2, 38
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
