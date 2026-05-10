; DESCRIPTION: Renders a white box of size 63x41 starting at (88, 189).
; PLAN: r0=88(x), r1=189(y), r2=63(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 189
LDI r2, 63
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
