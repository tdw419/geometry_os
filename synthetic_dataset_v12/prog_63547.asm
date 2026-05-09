; DESCRIPTION: Renders a white box of size 36x41 starting at (83, 201).
; PLAN: r0=83(x), r1=201(y), r2=36(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 201
LDI r2, 36
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
