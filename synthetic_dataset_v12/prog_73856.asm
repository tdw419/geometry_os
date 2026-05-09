; DESCRIPTION: Draws a blue rectangle at (238, 177) with width 23 and height 24.
; PLAN: r0=238(x), r1=177(y), r2=23(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 177
LDI r2, 23
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
