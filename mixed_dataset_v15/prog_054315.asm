; DESCRIPTION: Draws a purple rectangle at (383, 53) with width 120 and height 29.
; PLAN: r0=383(x), r1=53(y), r2=120(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 53
LDI r2, 120
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
