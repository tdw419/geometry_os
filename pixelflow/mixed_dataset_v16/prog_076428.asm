; DESCRIPTION: Draws a blue rectangle at (342, 21) with width 21 and height 77.
; PLAN: r0=342(x), r1=21(y), r2=21(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 21
LDI r2, 21
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
