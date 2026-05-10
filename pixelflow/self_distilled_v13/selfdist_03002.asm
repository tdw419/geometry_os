; DESCRIPTION: Draws a magenta rectangle at (210, 0) with width 112 and height 96.
; PLAN: r0=210(x), r1=0(y), r2=112(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 0
LDI r2, 112
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
