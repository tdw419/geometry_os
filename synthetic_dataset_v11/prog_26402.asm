; DESCRIPTION: Draws a blue rectangle at (84, 146) with width 116 and height 82.
; PLAN: r0=84(x), r1=146(y), r2=116(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 146
LDI r2, 116
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
