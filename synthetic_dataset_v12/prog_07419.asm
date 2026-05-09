; DESCRIPTION: Renders a white box of size 34x19 starting at (471, 11).
; PLAN: r0=471(x), r1=11(y), r2=34(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 11
LDI r2, 34
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
