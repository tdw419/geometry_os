; DESCRIPTION: Renders a white box of size 45x46 starting at (109, 11).
; PLAN: r0=109(x), r1=11(y), r2=45(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 11
LDI r2, 45
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
