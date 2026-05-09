; DESCRIPTION: Renders a white box of size 17x85 starting at (85, 0).
; PLAN: r0=85(x), r1=0(y), r2=17(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 0
LDI r2, 17
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
