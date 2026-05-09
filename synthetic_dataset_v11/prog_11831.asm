; DESCRIPTION: Draws a white rectangle at (120, 101) with width 73 and height 34.
; PLAN: r0=120(x), r1=101(y), r2=73(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 101
LDI r2, 73
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
