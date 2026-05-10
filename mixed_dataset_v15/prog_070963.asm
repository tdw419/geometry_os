; DESCRIPTION: Renders a white box of size 41x72 starting at (164, 12).
; PLAN: r0=164(x), r1=12(y), r2=41(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 12
LDI r2, 41
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
