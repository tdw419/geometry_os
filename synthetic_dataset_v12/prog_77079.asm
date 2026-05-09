; DESCRIPTION: Renders a white box of size 101x41 starting at (389, 8).
; PLAN: r0=389(x), r1=8(y), r2=101(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 8
LDI r2, 101
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
