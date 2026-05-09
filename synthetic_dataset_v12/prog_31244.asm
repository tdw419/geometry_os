; DESCRIPTION: Draws a white rectangle at (283, 82) with width 100 and height 55.
; PLAN: r0=283(x), r1=82(y), r2=100(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 82
LDI r2, 100
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
