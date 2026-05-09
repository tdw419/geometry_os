; DESCRIPTION: Renders a white box of size 85x56 starting at (274, 81).
; PLAN: r0=274(x), r1=81(y), r2=85(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 81
LDI r2, 85
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
