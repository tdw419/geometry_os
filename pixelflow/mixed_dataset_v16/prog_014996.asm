; DESCRIPTION: Renders a white box of size 19x14 starting at (83, 165).
; PLAN: r0=83(x), r1=165(y), r2=19(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 165
LDI r2, 19
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
