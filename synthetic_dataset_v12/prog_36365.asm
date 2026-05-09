; DESCRIPTION: Draws a white rectangle at (272, 203) with width 30 and height 51.
; PLAN: r0=272(x), r1=203(y), r2=30(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 203
LDI r2, 30
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
