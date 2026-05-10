; DESCRIPTION: Draws a white rectangle at (270, 24) with width 60 and height 80.
; PLAN: r0=270(x), r1=24(y), r2=60(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 24
LDI r2, 60
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
