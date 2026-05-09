; DESCRIPTION: Renders a green box of size 41x38 starting at (93, 60).
; PLAN: r0=93(x), r1=60(y), r2=41(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 60
LDI r2, 41
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
