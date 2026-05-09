; DESCRIPTION: Renders a white box of size 71x61 starting at (163, 71).
; PLAN: r0=163(x), r1=71(y), r2=71(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 71
LDI r2, 71
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
