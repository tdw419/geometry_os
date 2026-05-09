; DESCRIPTION: Draws a blue rectangle at (251, 31) with width 61 and height 76.
; PLAN: r0=251(x), r1=31(y), r2=61(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 31
LDI r2, 61
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
