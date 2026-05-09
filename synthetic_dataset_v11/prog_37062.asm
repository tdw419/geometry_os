; DESCRIPTION: Draws a purple rectangle at (16, 73) with width 53 and height 46.
; PLAN: r0=16(x), r1=73(y), r2=53(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 73
LDI r2, 53
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
