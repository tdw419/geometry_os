; DESCRIPTION: Draws a blue rectangle at (287, 112) with width 13 and height 113.
; PLAN: r0=287(x), r1=112(y), r2=13(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 112
LDI r2, 13
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
