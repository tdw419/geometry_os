; DESCRIPTION: Renders a white box of size 24x89 starting at (487, 78).
; PLAN: r0=487(x), r1=78(y), r2=24(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 78
LDI r2, 24
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
