; DESCRIPTION: Draws a blue rectangle at (247, 32) with width 62 and height 85.
; PLAN: r0=247(x), r1=32(y), r2=62(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 32
LDI r2, 62
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
