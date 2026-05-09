; DESCRIPTION: Draws a blue rectangle at (83, 173) with width 93 and height 54.
; PLAN: r0=83(x), r1=173(y), r2=93(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 173
LDI r2, 93
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
