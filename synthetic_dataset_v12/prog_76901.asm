; DESCRIPTION: Draws a blue rectangle at (4, 14) with width 21 and height 60.
; PLAN: r0=4(x), r1=14(y), r2=21(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 14
LDI r2, 21
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
