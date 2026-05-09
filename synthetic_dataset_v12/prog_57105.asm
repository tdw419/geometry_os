; DESCRIPTION: Renders a white box of size 33x89 starting at (211, 155).
; PLAN: r0=211(x), r1=155(y), r2=33(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 155
LDI r2, 33
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
