; DESCRIPTION: Renders a white box of size 86x95 starting at (159, 124).
; PLAN: r0=159(x), r1=124(y), r2=86(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 124
LDI r2, 86
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
