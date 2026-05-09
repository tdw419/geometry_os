; DESCRIPTION: Draws a blue rectangle at (200, 133) with width 98 and height 82.
; PLAN: r0=200(x), r1=133(y), r2=98(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 133
LDI r2, 98
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
