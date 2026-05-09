; DESCRIPTION: Renders a white box of size 67x41 starting at (31, 24).
; PLAN: r0=31(x), r1=24(y), r2=67(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 24
LDI r2, 67
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
