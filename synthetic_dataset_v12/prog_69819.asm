; DESCRIPTION: Draws a blue rectangle at (315, 2) with width 38 and height 93.
; PLAN: r0=315(x), r1=2(y), r2=38(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 2
LDI r2, 38
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
