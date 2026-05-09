; DESCRIPTION: Draws a blue rectangle at (178, 184) with width 61 and height 16.
; PLAN: r0=178(x), r1=184(y), r2=61(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 184
LDI r2, 61
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
