; DESCRIPTION: Draws a magenta rectangle at (95, 171) with width 119 and height 12.
; PLAN: r0=95(x), r1=171(y), r2=119(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 171
LDI r2, 119
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
