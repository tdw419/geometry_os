; DESCRIPTION: Draws a black rectangle at (83, 30) with width 43 and height 120.
; PLAN: r0=83(x), r1=30(y), r2=43(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 30
LDI r2, 43
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
