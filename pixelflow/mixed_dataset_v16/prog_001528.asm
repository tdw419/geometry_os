; DESCRIPTION: Draws a white rectangle at (307, 79) with width 119 and height 51.
; PLAN: r0=307(x), r1=79(y), r2=119(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 79
LDI r2, 119
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
