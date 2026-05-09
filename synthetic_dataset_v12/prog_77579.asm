; DESCRIPTION: Draws a magenta rectangle at (415, 96) with width 31 and height 50.
; PLAN: r0=415(x), r1=96(y), r2=31(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 96
LDI r2, 31
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
