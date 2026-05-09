; DESCRIPTION: Draws a blue rectangle at (29, 112) with width 50 and height 76.
; PLAN: r0=29(x), r1=112(y), r2=50(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 112
LDI r2, 50
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
