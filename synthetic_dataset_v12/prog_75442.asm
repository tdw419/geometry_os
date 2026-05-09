; DESCRIPTION: Draws a red rectangle at (72, 157) with width 110 and height 76.
; PLAN: r0=72(x), r1=157(y), r2=110(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 157
LDI r2, 110
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
