; DESCRIPTION: Draws a blue rectangle at (398, 25) with width 88 and height 111.
; PLAN: r0=398(x), r1=25(y), r2=88(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 25
LDI r2, 88
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
