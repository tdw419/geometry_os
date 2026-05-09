; DESCRIPTION: Renders a white box of size 82x43 starting at (163, 123).
; PLAN: r0=163(x), r1=123(y), r2=82(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 123
LDI r2, 82
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
