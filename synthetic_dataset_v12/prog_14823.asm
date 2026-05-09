; DESCRIPTION: Draws a blue rectangle at (299, 11) with width 21 and height 89.
; PLAN: r0=299(x), r1=11(y), r2=21(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 11
LDI r2, 21
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
