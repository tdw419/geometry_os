; DESCRIPTION: Renders a white box of size 118x114 starting at (43, 65).
; PLAN: r0=43(x), r1=65(y), r2=118(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 65
LDI r2, 118
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
