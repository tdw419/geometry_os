; DESCRIPTION: Draws a magenta rectangle at (327, 5) with width 81 and height 48.
; PLAN: r0=327(x), r1=5(y), r2=81(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 5
LDI r2, 81
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
