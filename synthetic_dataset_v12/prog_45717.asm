; DESCRIPTION: Renders a white box of size 56x31 starting at (163, 212).
; PLAN: r0=163(x), r1=212(y), r2=56(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 212
LDI r2, 56
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
