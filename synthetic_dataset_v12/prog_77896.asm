; DESCRIPTION: Renders a white box of size 78x75 starting at (11, 124).
; PLAN: r0=11(x), r1=124(y), r2=78(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 124
LDI r2, 78
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
