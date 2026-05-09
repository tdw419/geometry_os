; DESCRIPTION: Draws a blue rectangle at (241, 4) with width 37 and height 103.
; PLAN: r0=241(x), r1=4(y), r2=37(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 4
LDI r2, 37
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
