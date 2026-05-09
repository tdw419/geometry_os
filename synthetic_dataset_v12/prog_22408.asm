; DESCRIPTION: Draws a blue rectangle at (365, 135) with width 25 and height 70.
; PLAN: r0=365(x), r1=135(y), r2=25(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 135
LDI r2, 25
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
