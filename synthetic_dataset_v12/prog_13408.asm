; DESCRIPTION: Renders a white box of size 72x73 starting at (41, 69).
; PLAN: r0=41(x), r1=69(y), r2=72(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 69
LDI r2, 72
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
