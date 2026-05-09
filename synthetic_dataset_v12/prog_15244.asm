; DESCRIPTION: Draws a white rectangle at (358, 82) with width 110 and height 76.
; PLAN: r0=358(x), r1=82(y), r2=110(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 82
LDI r2, 110
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
