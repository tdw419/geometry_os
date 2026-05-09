; DESCRIPTION: Renders a white box of size 45x72 starting at (121, 124).
; PLAN: r0=121(x), r1=124(y), r2=45(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 124
LDI r2, 45
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
