; DESCRIPTION: Draws a white rectangle at (90, 76) with width 76 and height 51.
; PLAN: r0=90(x), r1=76(y), r2=76(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 76
LDI r2, 76
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
