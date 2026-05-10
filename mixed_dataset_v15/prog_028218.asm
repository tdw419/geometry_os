; DESCRIPTION: Renders a white box of size 29x102 starting at (419, 130).
; PLAN: r0=419(x), r1=130(y), r2=29(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 130
LDI r2, 29
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
