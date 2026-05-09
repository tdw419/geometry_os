; DESCRIPTION: Renders a white box of size 11x52 starting at (266, 87).
; PLAN: r0=266(x), r1=87(y), r2=11(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 87
LDI r2, 11
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
