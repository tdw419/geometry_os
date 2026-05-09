; DESCRIPTION: Renders a white box of size 96x20 starting at (210, 41).
; PLAN: r0=210(x), r1=41(y), r2=96(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 41
LDI r2, 96
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
