; DESCRIPTION: Draws a purple rectangle at (326, 16) with width 53 and height 70.
; PLAN: r0=326(x), r1=16(y), r2=53(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 16
LDI r2, 53
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
