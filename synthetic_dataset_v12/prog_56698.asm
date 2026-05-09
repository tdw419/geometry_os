; DESCRIPTION: Draws a white rectangle at (273, 159) with width 76 and height 20.
; PLAN: r0=273(x), r1=159(y), r2=76(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 159
LDI r2, 76
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
