; DESCRIPTION: Draws a magenta rectangle at (96, 124) with width 48 and height 53.
; PLAN: r0=96(x), r1=124(y), r2=48(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 124
LDI r2, 48
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
