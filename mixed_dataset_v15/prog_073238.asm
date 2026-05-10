; DESCRIPTION: Renders a white box of size 106x57 starting at (306, 122).
; PLAN: r0=306(x), r1=122(y), r2=106(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 122
LDI r2, 106
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
