; DESCRIPTION: Renders a white box of size 21x112 starting at (259, 41).
; PLAN: r0=259(x), r1=41(y), r2=21(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 41
LDI r2, 21
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
