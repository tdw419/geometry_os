; DESCRIPTION: Draws a blue rectangle at (467, 189) with width 21 and height 58.
; PLAN: r0=467(x), r1=189(y), r2=21(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 189
LDI r2, 21
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
