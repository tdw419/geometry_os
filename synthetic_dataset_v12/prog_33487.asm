; DESCRIPTION: Renders a white box of size 11x48 starting at (18, 52).
; PLAN: r0=18(x), r1=52(y), r2=11(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 52
LDI r2, 11
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
