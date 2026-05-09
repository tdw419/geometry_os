; DESCRIPTION: Draws a blue rectangle at (322, 119) with width 50 and height 38.
; PLAN: r0=322(x), r1=119(y), r2=50(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 119
LDI r2, 50
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
