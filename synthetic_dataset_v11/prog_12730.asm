; DESCRIPTION: Draws a blue rectangle at (102, 131) with width 21 and height 38.
; PLAN: r0=102(x), r1=131(y), r2=21(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 131
LDI r2, 21
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
