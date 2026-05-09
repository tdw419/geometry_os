; DESCRIPTION: Draws a blue rectangle at (85, 72) with width 26 and height 120.
; PLAN: r0=85(x), r1=72(y), r2=26(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 72
LDI r2, 26
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
