; DESCRIPTION: Draws a blue rectangle at (21, 36) with width 53 and height 87.
; PLAN: r0=21(x), r1=36(y), r2=53(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 36
LDI r2, 53
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
