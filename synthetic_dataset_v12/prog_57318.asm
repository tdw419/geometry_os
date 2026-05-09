; DESCRIPTION: Draws a white rectangle at (429, 61) with width 80 and height 105.
; PLAN: r0=429(x), r1=61(y), r2=80(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 61
LDI r2, 80
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
