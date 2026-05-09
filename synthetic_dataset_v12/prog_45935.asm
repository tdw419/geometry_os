; DESCRIPTION: Draws a black rectangle at (256, 5) with width 62 and height 32.
; PLAN: r0=256(x), r1=5(y), r2=62(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 5
LDI r2, 62
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
