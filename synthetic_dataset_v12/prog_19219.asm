; DESCRIPTION: Draws a blue rectangle at (82, 132) with width 17 and height 42.
; PLAN: r0=82(x), r1=132(y), r2=17(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 132
LDI r2, 17
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
