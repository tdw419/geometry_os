; DESCRIPTION: Renders a white box of size 45x30 starting at (189, 191).
; PLAN: r0=189(x), r1=191(y), r2=45(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 191
LDI r2, 45
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
