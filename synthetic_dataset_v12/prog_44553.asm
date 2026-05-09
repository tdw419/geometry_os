; DESCRIPTION: Draws a magenta rectangle at (205, 171) with width 103 and height 55.
; PLAN: r0=205(x), r1=171(y), r2=103(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 171
LDI r2, 103
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
