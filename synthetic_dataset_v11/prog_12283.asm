; DESCRIPTION: Renders a white box of size 43x106 starting at (100, 109).
; PLAN: r0=100(x), r1=109(y), r2=43(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 109
LDI r2, 43
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
