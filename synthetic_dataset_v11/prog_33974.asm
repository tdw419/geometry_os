; DESCRIPTION: Renders a white box of size 76x71 starting at (26, 122).
; PLAN: r0=26(x), r1=122(y), r2=76(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 122
LDI r2, 76
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
