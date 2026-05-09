; DESCRIPTION: Draws a white rectangle at (83, 102) with width 80 and height 120.
; PLAN: r0=83(x), r1=102(y), r2=80(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 102
LDI r2, 80
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
