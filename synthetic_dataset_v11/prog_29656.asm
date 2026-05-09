; DESCRIPTION: Draws a white rectangle at (93, 172) with width 109 and height 38.
; PLAN: r0=93(x), r1=172(y), r2=109(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 172
LDI r2, 109
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
