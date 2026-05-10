; DESCRIPTION: Draws a blue rectangle at (272, 33) with width 83 and height 41.
; PLAN: r0=272(x), r1=33(y), r2=83(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 33
LDI r2, 83
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
