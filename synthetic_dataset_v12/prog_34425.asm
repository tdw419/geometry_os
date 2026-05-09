; DESCRIPTION: Draws a blue rectangle at (383, 179) with width 10 and height 76.
; PLAN: r0=383(x), r1=179(y), r2=10(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 179
LDI r2, 10
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
