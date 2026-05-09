; DESCRIPTION: Renders a white box of size 114x89 starting at (50, 43).
; PLAN: r0=50(x), r1=43(y), r2=114(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 43
LDI r2, 114
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
