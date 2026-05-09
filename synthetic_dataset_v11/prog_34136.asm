; DESCRIPTION: Renders a white box of size 12x72 starting at (233, 124).
; PLAN: r0=233(x), r1=124(y), r2=12(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 124
LDI r2, 12
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
