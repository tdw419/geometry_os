; DESCRIPTION: Renders a white box of size 36x119 starting at (178, 62).
; PLAN: r0=178(x), r1=62(y), r2=36(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 62
LDI r2, 36
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
