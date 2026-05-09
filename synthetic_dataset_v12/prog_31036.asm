; DESCRIPTION: Draws a blue rectangle at (397, 74) with width 44 and height 79.
; PLAN: r0=397(x), r1=74(y), r2=44(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 74
LDI r2, 44
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
