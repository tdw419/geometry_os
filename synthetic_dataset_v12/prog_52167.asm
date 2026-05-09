; DESCRIPTION: Renders a black box of size 56x52 starting at (318, 33).
; PLAN: r0=318(x), r1=33(y), r2=56(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 33
LDI r2, 56
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
