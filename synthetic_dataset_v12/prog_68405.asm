; DESCRIPTION: Renders a white box of size 66x52 starting at (444, 5).
; PLAN: r0=444(x), r1=5(y), r2=66(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 5
LDI r2, 66
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
