; DESCRIPTION: Renders a white box of size 24x41 starting at (367, 121).
; PLAN: r0=367(x), r1=121(y), r2=24(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 121
LDI r2, 24
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
