; DESCRIPTION: Draws a blue rectangle at (414, 36) with width 82 and height 24.
; PLAN: r0=414(x), r1=36(y), r2=82(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 36
LDI r2, 82
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
