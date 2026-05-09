; DESCRIPTION: Draws a blue rectangle at (119, 26) with width 77 and height 72.
; PLAN: r0=119(x), r1=26(y), r2=77(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 26
LDI r2, 77
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
