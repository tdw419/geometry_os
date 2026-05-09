; DESCRIPTION: Renders a white box of size 11x26 starting at (34, 21).
; PLAN: r0=34(x), r1=21(y), r2=11(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 21
LDI r2, 11
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
