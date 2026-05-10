; DESCRIPTION: Draws a blue rectangle at (33, 153) with width 45 and height 77.
; PLAN: r0=33(x), r1=153(y), r2=45(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 153
LDI r2, 45
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
