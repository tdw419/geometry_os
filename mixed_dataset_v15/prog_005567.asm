; DESCRIPTION: Draws a green rectangle at (429, 80) with width 60 and height 37.
; PLAN: r0=429(x), r1=80(y), r2=60(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 80
LDI r2, 60
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
