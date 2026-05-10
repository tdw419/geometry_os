; DESCRIPTION: Draws a orange rectangle at (478, 150) with width 20 and height 76.
; PLAN: r0=478(x), r1=150(y), r2=20(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 150
LDI r2, 20
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
