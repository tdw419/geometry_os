; DESCRIPTION: Draws a white rectangle at (293, 49) with width 80 and height 120.
; PLAN: r0=293(x), r1=49(y), r2=80(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 49
LDI r2, 80
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
