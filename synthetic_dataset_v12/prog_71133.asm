; DESCRIPTION: Draws a magenta rectangle at (92, 128) with width 38 and height 96.
; PLAN: r0=92(x), r1=128(y), r2=38(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 128
LDI r2, 38
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
