; DESCRIPTION: Draws a blue rectangle at (32, 61) with width 72 and height 83.
; PLAN: r0=32(x), r1=61(y), r2=72(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 61
LDI r2, 72
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
