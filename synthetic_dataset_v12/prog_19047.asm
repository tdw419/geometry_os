; DESCRIPTION: Draws a blue rectangle at (421, 147) with width 42 and height 96.
; PLAN: r0=421(x), r1=147(y), r2=42(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 147
LDI r2, 42
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
