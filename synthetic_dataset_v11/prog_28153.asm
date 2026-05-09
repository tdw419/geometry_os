; DESCRIPTION: Draws a blue rectangle at (109, 143) with width 87 and height 92.
; PLAN: r0=109(x), r1=143(y), r2=87(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 143
LDI r2, 87
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
