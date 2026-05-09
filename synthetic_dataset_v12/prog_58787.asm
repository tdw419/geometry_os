; DESCRIPTION: Draws a white rectangle at (93, 34) with width 93 and height 109.
; PLAN: r0=93(x), r1=34(y), r2=93(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 34
LDI r2, 93
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
