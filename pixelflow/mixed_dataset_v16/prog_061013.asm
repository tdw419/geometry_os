; DESCRIPTION: Draws a blue rectangle at (109, 102) with width 102 and height 80.
; PLAN: r0=109(x), r1=102(y), r2=102(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 102
LDI r2, 102
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
