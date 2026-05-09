; DESCRIPTION: Draws a blue rectangle at (82, 31) with width 52 and height 116.
; PLAN: r0=82(x), r1=31(y), r2=52(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 31
LDI r2, 52
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
