; DESCRIPTION: Draws a blue rectangle at (389, 73) with width 11 and height 82.
; PLAN: r0=389(x), r1=73(y), r2=11(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 73
LDI r2, 11
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
