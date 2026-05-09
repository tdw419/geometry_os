; DESCRIPTION: Draws a magenta rectangle at (254, 171) with width 109 and height 21.
; PLAN: r0=254(x), r1=171(y), r2=109(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 171
LDI r2, 109
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
