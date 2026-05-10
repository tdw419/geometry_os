; DESCRIPTION: Draws a blue rectangle at (461, 128) with width 10 and height 120.
; PLAN: r0=461(x), r1=128(y), r2=10(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 128
LDI r2, 10
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
