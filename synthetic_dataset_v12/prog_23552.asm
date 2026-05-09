; DESCRIPTION: Renders a white box of size 93x89 starting at (411, 122).
; PLAN: r0=411(x), r1=122(y), r2=93(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 122
LDI r2, 93
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
