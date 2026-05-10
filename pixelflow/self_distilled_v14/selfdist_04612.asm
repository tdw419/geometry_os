; DESCRIPTION: Draws a white rectangle at (26, 120) with width 100 and height 60.
; PLAN: r0=26(x), r1=120(y), r2=100(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 120
LDI r2, 100
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
