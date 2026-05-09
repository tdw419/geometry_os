; DESCRIPTION: Draws a blue rectangle at (200, 177) with width 33 and height 72.
; PLAN: r0=200(x), r1=177(y), r2=33(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 177
LDI r2, 33
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
