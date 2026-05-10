; DESCRIPTION: Renders a white box of size 73x10 starting at (285, 41).
; PLAN: r0=285(x), r1=41(y), r2=73(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 41
LDI r2, 73
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
