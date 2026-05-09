; DESCRIPTION: Draws a blue rectangle at (2, 82) with width 80 and height 53.
; PLAN: r0=2(x), r1=82(y), r2=80(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 82
LDI r2, 80
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
