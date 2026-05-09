; DESCRIPTION: Draws a blue rectangle at (180, 25) with width 12 and height 82.
; PLAN: r0=180(x), r1=25(y), r2=12(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 25
LDI r2, 12
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
