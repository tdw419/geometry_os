; DESCRIPTION: Draws a blue rectangle at (52, 95) with width 82 and height 49.
; PLAN: r0=52(x), r1=95(y), r2=82(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 95
LDI r2, 82
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
