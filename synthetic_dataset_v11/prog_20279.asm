; DESCRIPTION: Renders a white box of size 71x119 starting at (29, 19).
; PLAN: r0=29(x), r1=19(y), r2=71(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 19
LDI r2, 71
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
