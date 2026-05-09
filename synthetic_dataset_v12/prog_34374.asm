; DESCRIPTION: Draws a white rectangle at (345, 40) with width 15 and height 120.
; PLAN: r0=345(x), r1=40(y), r2=15(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 40
LDI r2, 15
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
